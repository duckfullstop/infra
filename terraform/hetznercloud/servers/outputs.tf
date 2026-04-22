output "k8s_apiserver_addr_v4" {
  description = "Kubernetes API server IPv4 address"
  value       = hcloud_primary_ip.hnbg1-k-a-v4.ip_address
}

output "k8s_apiserver_addr_v6" {
  description = "Kubernetes API server IPv6 address"
  value       = hcloud_primary_ip.hnbg1-k-a-v6.ip_address
}

output "k8s_client_cert" {
  description = "clusteradmin client certificate"
  value = base64decode(replace(data.external.kubeconfig.result.client_cert, " ", ""))
  sensitive = true
}

output "k8s_client_key" {
  description = "clusteradmin client key"
  value = base64decode(replace(data.external.kubeconfig.result.client_key, " ", ""))
  sensitive = true
}

output "k8s_cacert" {
  description = "clusteradmin ca certificate"
  value = base64decode(replace(data.external.kubeconfig.result.cacert, " ", ""))
}