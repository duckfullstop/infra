{ config, lib, pkgs, nixpkgs, ... }:
{
  imports = [ 
    "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix"
  ];
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "xen_blkfront" ];
  boot.initrd.kernelModules = [ "nvme" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };

  boot.vesa = false;
  boot.kernelParams = [ "panic=1" "boot.panic_on_fail" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bit yucky - ordinarily we'd use by-uuid but they're not guaranteed upon machine creation
  # fileSystems."/boot" = { device = "/dev/sda15"; fsType = "vfat"; };
  # fileSystems."/" = { device = "/dev/sda1"; fsType = "ext4"; };

  # Networking config
  networking = {
    # Hetzner Cloud should deliver us IPv4 via DHCP
    # but we have to do v6 ourselves :(
    useNetworkd = true;
    useDHCP = false;
    timeServers = [
      "ntp1.hetzner.de"
      "ntp2.hetzner.com"
      "ntp3.hetzner.de"
    ];
    usePredictableInterfaceNames = lib.mkForce false;
  };
  systemd.network.networks."10-uplink" = {
    matchConfig.Name = lib.mkDefault "en* eth0";
    networkConfig.DHCP = "ipv4";
    # hetzner requires static ipv6 addresses
    networkConfig.Gateway = "fe80::1";
    networkConfig.IPv6AcceptRA = "no";
  };

  boot.initrd.systemd.network.networks."10-uplink" = config.systemd.network.networks."10-uplink";

  services.cloud-init.enable = lib.mkForce false;
}