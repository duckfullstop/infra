// The pve-honshu module handles Proxmox VMs running at home.

provider "proxmox" {
    pm_api_url = "https://10.0.100.1:8006/api2/json"
    pm_api_token_id = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
}
