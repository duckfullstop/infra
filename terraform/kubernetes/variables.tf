variable "client_cert" {
  description = "clusteradmin client certificate"
  sensitive = true
}

variable "client_key" {
  description = "clusteradmin client key"
  sensitive = true
}

variable "ca_cert" {
  description = "clusteradmin ca certificate"
}

variable "hetzner_cluster_apikey" {
    description = "hetzner APIKey for use inside cluster"
    sensitive = true
}