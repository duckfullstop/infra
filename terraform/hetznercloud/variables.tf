variable "op_ssh_key_public" {
    description = "Public key of the SSH user given access to all boxes."
}

variable "token" {
    description = "API token to authenticate to Hetzner Cloud with."
    sensitive = true
}

variable "deploy_key_public" {
    description = "Public deploy key."
}
variable "deploy_key_private" {
    description = "Private deploy key."
    sensitive = true
}

locals {
    cidr_blocks_ipv4            = ["10.0.0.0/24", "10.1.0.0/24"]
    cidr_blocks_ipv6            = ["fc00:beef::/64"]
}