variable "ssh_authorized_keys" {
  description = "List of authorized SSH keys"
  type        = list(any)
}

variable "ssh_private_key" {
  description = "SSH key to use for deploying NixOS"
  sensitive = true
}

variable "nixos_vars_file" {
  type        = string
  description = "File to write NixOS configuration variables to"
}

variable "sops_file" {
  type        = string
  description = "File to SOPS secrets file"
}
