resource "hcloud_ssh_key" "deploy" {
  name       = "Terraform Deploy Key"
  public_key = var.ssh_authorized_keys[0]
  labels = {
    ducknet = "true"
  }
}

data "hcloud_ssh_keys" "ducknet" {
  with_selector = "ducknet=true"
}