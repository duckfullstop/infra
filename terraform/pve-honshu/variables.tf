variable "api_token_id" {
    description = "API token ID to authenticate to proxmox with."
}
variable "api_token_secret" {
    description = "API token secret to authenticate to proxmox with."
    sensitive = true
}