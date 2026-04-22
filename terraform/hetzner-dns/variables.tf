variable "key" {
    description = "API key to authenticate to hetzner DNS with."
}

variable "dn_k8s_apiserver_ipv4" {
    description = "IPv4 address for access to the ducknet k8s apiserver."
}
variable "dn_k8s_apiserver_ipv6" {
    description = "IPv6 address for access to the ducknet k8s apiserver."
}