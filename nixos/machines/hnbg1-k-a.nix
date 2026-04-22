{ config, lib, pkgs, ... }:
let
  nixosVars = builtins.fromJSON (builtins.readFile ./tf-vars.json);
in
{
  imports = [ ../includes/base.nix ../includes/hetzner-guest.nix ../includes/single-disk.nix ../includes/k8s-singlenode.nix ];

  # Networking config
  networking = {
    hostName = "hnbg1-k-a";
    domain = "srv.net.duck.moe";
  };
  systemd.network.networks."10-uplink".networkConfig.Address = nixosVars.ipv6_address;

  system.stateVersion = "24.11";

  services.kubernetes = {
    apiserver = {
      advertiseAddress = nixosVars.ipv6_address;
    };
    kubelet = {
      nodeIp = nixosVars.ipv6_address + ","+ nixosVars.ipv4_address;
    };
    proxy = {
      hostname = config.networking.hostName + "." + config.networking.domain;
    };
  };
}