/* module "pve-honshu" {
  source = "./pve-honshu"
  api_token_id = var.pve_honshu_token_id
  api_token_secret = var.pve_honshu_token_secret
} */


/* module "oci" {
  source            = "./oci"
  op_ssh_key_public = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAPvEmMVkwPSc6xt/zY0yKlIiwFzNAMhnuAyvVikIoux8CUWyU+Tig/WOP/Z+H2vKbkjVtr0J2kKUoFjalaXd50= se.powerduck@secretive.powerduck.local"

  deploy_key_public = var.deploy_key_public
  deploy_key_private = file(var.deploy_key_private)
  # Secret sauce
  user_ocid      = var.oracle_user_ocid
  tenancy_ocid   = var.oracle_tenancy_ocid
  region         = var.oracle_region
  fingerprint    = var.oracle_fingerprint
  private_key    = file(var.oracle_private_key)
}
 */

module "hetznercloud" {
  source            = "./hetznercloud"
  op_ssh_key_public = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAPvEmMVkwPSc6xt/zY0yKlIiwFzNAMhnuAyvVikIoux8CUWyU+Tig/WOP/Z+H2vKbkjVtr0J2kKUoFjalaXd50= se.powerduck@secretive.powerduck.local"

  deploy_key_public = var.deploy_key_public
  deploy_key_private = file(var.deploy_key_private)
  # Secret sauce
  token      = var.hetzner_api_token
}

module "kubernetes" {
  source = "./kubernetes"
  client_cert = module.hetznercloud.k8s_client_cert
  client_key = module.hetznercloud.k8s_client_key
  ca_cert = module.hetznercloud.k8s_cacert
  hetzner_cluster_apikey = var.hetzner_api_token
}

module "porkbun" {
  source = "./porkbun"
  key = var.porkbun_api_key
  secret = var.porkbun_api_secret
}

module "hetzner-dns" {
  source = "./hetzner-dns"
  key = var.hetzner_dns_token

  dn_k8s_apiserver_ipv4 = "0.0.0.0"
  dn_k8s_apiserver_ipv6 = "2a01:4f8:1c1c:ebcc::1"
}
