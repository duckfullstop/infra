{ config, lib, pkgs, self, nixpkgs, nix, ... }:
{

  # system.configurationRevision = self.rev
  #   or (throw "Cannot deploy from an unclean source tree!");

  nix = {
    extraOptions = ''
      # To not get caught by the '''"nix-collect-garbage -d" makes
      # "nixos-rebuild switch" unusable when nixos.org is down"''' issue:
      gc-keep-outputs = true
      # Number of seconds to wait for binary-cache to accept() our connect()
      connect-timeout = 15
    '';
    #generateNixPathFromInputs = true;
    #generateRegistryFromInputs = true;
    #linkInputs = true;
    nixPath = [ "nixpkgs=${nixpkgs}" ];
    registry.nixpkgs.flake = nixpkgs;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    settings = {
      sandbox = true;
      cores = 0;
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
    };
  };


  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;

  # Select internationalisation properties.
  time.timeZone = "Other/UTC";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  # Some basic useful packages.
  environment.systemPackages = with pkgs; [
    wget
    vim nano
    htop
    git
    git-crypt
    file
    traceroute
    tmux
    mosh
    screen
  ];

  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings = {
      # PermitRootLogin = "no";
      X11Forwarding = true;
      PasswordAuthentication = false;
      KexAlgorithms = [ "curve25519-sha256@libssh.org" "diffie-hellman-group-exchange-sha256" "ecdh-sha2-nistp521" "ecdh-sha2-nistp384" "ecdh-sha2-nistp256" ];
      KbdInteractiveAuthentication = false;
    };
  };

  users = {
    mutableUsers = false;
    users.root.openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAPvEmMVkwPSc6xt/zY0yKlIiwFzNAMhnuAyvVikIoux8CUWyU+Tig/WOP/Z+H2vKbkjVtr0J2kKUoFjalaXd50= se.powerduck@secretive.powerduck.local"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDRRwi6guhAkeweWejHhXRxpMcMTBLcdafh3Ycxh7Ccp deploy.net.duck."
    ];
    users.root.password = "changeme";
  };

  # sops.defaultSopsFile = ./secrets/secrets.yaml;
}
