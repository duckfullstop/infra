{ config, lib, pkgs, ... }:
{
  boot.kernel.sysctl = {
    # Allow forwarding across interfaces
    "net.ipv6.conf.all.forwarding" = 1;
    "net.ipv4.conf.all.forwarding" = 1;
    # k8s opens a LOT of files, raise the total number of openable files so we don't end up getting issues in userland
    "fs.inotify.max_user_instances" = 16384;
    "fs.inotify.max_user_watches" = 1048576;
    "vm.max_map_count" = 524288;
    # "vm.swappiness" = 10;
  };

  boot.kernelParams = [
    "cgroup_memory=1"
    "cgroup_enable=memory"
  ];

  # Onboard firewall disabled when using k8s, as services holepunch and expose themselves.
  networking.firewall.enable = false;

  # Useful packages
  environment.systemPackages = with pkgs; [
    cri-tools # crictl and other useful "everything is on fire" utilities.
    kubectl kubetail
  ];

  # Containerd config

  # Set CRI binary directory to location where they'll be dropped by kubernetes setup containers
  # important note: this only works if the container drops a statically linked binary,
  # as dynamically linked ones would be looking for binaries that only exist in the nix store
  # (and not in conventional locations)
  virtualisation.containerd.settings = {
    plugins."io.containerd.grpc.v1.cri" = {
      containerd.snapshotter = "overlayfs";
      cni.bin_dir = "/opt/cni/bin";
    };
  };


  # disable creating the CNI directory (flannel will make it for us)
  environment.etc."cni/net.d".enable = false;

  # Core Kubernetes config.
  services.kubernetes = {
    # because fuck PKI honestly
    easyCerts = true;
    # this is a master system that also runs workloads, so it's a master node
    roles = ["master" "node"];
    # prefer to define the network ourselves instead
    flannel.enable = false;
    # where can we contact the apiserver?
    apiserverAddress = "https://apiserver.k8s.net.duck.moe:6443";
    masterAddress = "apiserver.k8s.net.duck.moe";

    # ipv4 cidr should be before ipv6 otherwise apps that make assumptions break horribly when binding to ipv4 interfaces and then attempting to contact themselves over ipv6
    clusterCidr = "172.24.0.0/16,fc00:abc1::/48";

    # define dns separately
    addons.dns.enable = false;

    apiserver = {
      # address to advertise the apiserver at, must be reachable by the rest of the cluster
      # defined at node level
      # advertiseAddress = "apiserver.k8s.net.duck.moe";
      # privileged pods are required to run cluster services like MetalLB and longhorn
      allowPrivileged = true;
      # bind to ipv4 & ipv6
      bindAddress = "::";
      # needed otherwise we end up with a cert that isn't valid for ipv6
      extraSANs = [ "fc00:abc0::1" "172.25.0.1" ];
      serviceClusterIpRange = "fc00:abc0::/112,172.25.0.0/16";
      # allow all ports (this is a really bad idea don't do this with untrusted workloads)
      extraOpts = "--oidc-issuer-url=https://id.duck.moe --oidc-client-id=bc0d2227-ef5e-4143-92a8-3c42765682f7 --oidc-username-prefix='oidc:' --oidc-groups-claim=groups --oidc-groups-prefix='oidc:' --service-node-port-range=1-65535";
      enableAdmissionPlugins = [
        "NamespaceLifecycle" "LimitRanger" "ServiceAccount" "TaintNodesByCondition" "Priority" "DefaultTolerationSeconds"
        "DefaultStorageClass" "StorageObjectInUseProtection" "PersistentVolumeClaimResize" "RuntimeClass" "CertificateApproval" "CertificateSigning"
        "CertificateSubjectRestriction" "DefaultIngressClass" "MutatingAdmissionWebhook" "ValidatingAdmissionWebhook" "ResourceQuota"
      ];
    };
    controllerManager = {
      # bind to localhost ipv6
      bindAddress = "::1";
      extraOpts = "--service-cluster-ip-range=fc00:abc0::/64,172.25.0.0/16 --node-cidr-mask-size-ipv4=24 --node-cidr-mask-size-ipv6=64";
    };
    kubelet = {
      featureGates = { "NodeSwap" = true; };
      clusterDns = [ "fc00:abc0::254" ];
      cni.configDir = "/etc/cni/net.d";
      # nodeIp = "10.0.0.1,2a02:8010:61d0:beef:21f:29ff:fe58:9280";
      # extraConfig = {
      #   "resolv-conf" = "/run/systemd/resolve/resolv.conf";
      # };
      extraConfig = {
        "failSwapOn" = false;
        "memorySwap" = {
          "swapBehavior" = "LimitedSwap";
        };
      };
      extraOpts = ''
        # --cni-bin-dir=/opt/cni/bin \
        --root-dir=/var/lib/kubelet \
        # --fail-swap-on=false \
        --resolv-conf=/run/systemd/resolve/resolv.conf \
        # --eviction-soft="imagefs.available<20%,nodefs.available<15%"
        # --eviction-soft-grace-period="imagefs.available=5m,nodefs.available=5m"
        # --allowed-unsafe-sysctls 'fs.nr_open'
      '';
    };
    proxy = {
      # bind to ipv6
      bindAddress = "::";
      # hostname = "nagoya.srv.net.theleachfamily.me.uk";
    };
  };

  # This by default removes all CNI plugins and replaces them with nix-defines ones
  # Since we bring our own CNI plugins via containers with host mounts, this causes
  # them to be removed on kubelet restart.
  # TODO(https://github.com/NixOS/nixpkgs/issues/53601): fix when resolved
  systemd.services.kubelet = {
    preStart = pkgs.lib.mkForce ''
      ${lib.concatMapStrings (img: ''
        echo "Seeding container image: ${img}"
        ${if (lib.hasSuffix "gz" img) then
          ''${pkgs.gzip}/bin/zcat "${img}" | ${pkgs.containerd}/bin/ctr -n k8s.io image import -''
        else
          ''${pkgs.coreutils}/bin/cat "${img}" | ${pkgs.containerd}/bin/ctr -n k8s.io image import -''
        }
      '') config.services.kubernetes.kubelet.seedDockerImages}
      ${lib.concatMapStrings (package: ''
        echo "Linking cni package: ${package}"
        ln -fs ${package}/bin/* /opt/cni/bin
      '') config.services.kubernetes.kubelet.cni.packages}
      '';
  };
}
