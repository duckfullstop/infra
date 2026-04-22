output "hetzner_k8s_client_cert" {
  description = "clusteradmin client certificate"
  value = module.hetznercloud.k8s_client_cert
  sensitive = true
}

output "hetzner_k8s_client_key" {
  description = "clusteradmin client key"
  value = module.hetznercloud.k8s_client_key
  sensitive = true
}

output "hetzner_k8s_cacert" {
  description = "clusteradmin ca certificate"
  value = module.hetznercloud.k8s_cacert
  sensitive = true
}