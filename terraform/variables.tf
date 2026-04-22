variable "hetzner_api_token" {
  sensitive = true
}
variable "hetzner_dns_token" {
  sensitive = true
}

variable "pve_honshu_token_id" {
  sensitive = true
}
variable "pve_honshu_token_secret" {
  sensitive = true
}

variable "gandi_api_key" {
  sensitive = true
}

variable "porkbun_api_key" {
  sensitive = true
}
variable "porkbun_api_secret" {
  sensitive = true
}

variable "oracle_user_ocid" {
  sensitive = true
}
variable "oracle_tenancy_ocid" {
  sensitive = true
}
variable "oracle_region" {
  sensitive = true
}
variable "oracle_fingerprint" {
  sensitive = true
}
variable "oracle_private_key" {
  sensitive = true
}
variable "deploy_key_public" {
    description = "Public deploy key."
}
variable "deploy_key_private" {
    description = "Private deploy key."
    sensitive = true
}