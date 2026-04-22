resource "hcloud_placement_group" "k8s" {
  name = "kubernetes"
  type = "spread"
}

resource "hcloud_server" "nbg1-k-a" {
  name        = "nbg1-k-a"
  image       = "debian-11"
  # keep_disk   = true
  server_type = "cax11"
  location    = "nbg1"
  placement_group_id = hcloud_placement_group.k8s.id
  public_net {
    ipv4_enabled = true
    ipv4 = hcloud_primary_ip.hnbg1-k-a-v4.id
    ipv6_enabled = true
    ipv6 = hcloud_primary_ip.hnbg1-k-a-v6.id
  }

  ssh_keys = data.hcloud_ssh_keys.ducknet.ssh_keys.*.name

  lifecycle {
    # Don't destroy server instance if ssh keys changes.
    ignore_changes  = [ssh_keys]
    prevent_destroy = false
  }
}

module "deploy" {
  depends_on             = [local_file.nixos_vars]
  source                 = "github.com/numtide/nixos-anywhere//terraform/all-in-one"
  nixos_system_attr      = "../nixos/.#nixosConfigurations.hnbg1-k-a.config.system.build.toplevel"
  nixos_partitioner_attr = "../nixos/.#nixosConfigurations.hnbg1-k-a.config.system.build.diskoScriptNoDeps"
  target_host            = hcloud_server.nbg1-k-a.ipv4_address
  instance_id            = hcloud_server.nbg1-k-a.id
  # extra_files_script     = "${path.module}/decrypt-age-keys.sh"
  # extra_environment = {
  #  SOPS_FILE = var.sops_file
  # }
  debug_logging = true
}

locals {
  nixos_vars = {
    ipv4_address = hcloud_server.nbg1-k-a.ipv4_address
    ipv6_address = hcloud_server.nbg1-k-a.ipv6_address
    ssh_keys     = data.hcloud_ssh_keys.ducknet.ssh_keys.*.public_key
  }
}
