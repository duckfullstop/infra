output "k8s_apiserver_addr_v4" {
  description = "Kubernetes API server IPv4 address"
  value       = module.servers.k8s_apiserver_addr_v4
}

output "k8s_apiserver_addr_v6" {
  description = "Kubernetes API server IPv6 address"
  value       = module.servers.k8s_apiserver_addr_v6
}

output "k8s_client_cert" {
  description = "clusteradmin client certificate"
  value = module.servers.k8s_client_cert
  sensitive = true
}

output "k8s_client_key" {
  description = "clusteradmin client key"
  value = module.servers.k8s_client_key
  sensitive = true
}

output "k8s_cacert" {
  description = "clusteradmin ca certificate"
  value = module.servers.k8s_cacert
}