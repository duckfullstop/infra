provider "hcloud" {
    token = var.token
}


module "servers" {
  source     = "./servers"
  // depends_on = [module.network]
  
  nixos_vars_file  = "${path.root}/../nixos/machines/tf-vars.json"
  sops_file        = abspath("${path.module}/secrets/secrets.yaml")

  ssh_authorized_keys = [var.deploy_key_public, var.op_ssh_key_public]
  ssh_private_key = var.deploy_key_private
}