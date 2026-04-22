resource "hcloud_primary_ip" "hnbg1-k-a-v4" {
  name          = "hnbg1-k-a-priv4"
  datacenter    = "nbg1-dc3"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_rdns" "hnbg1-k-a-v4" {
  primary_ip_id = hcloud_primary_ip.hnbg1-k-a-v4.id
  ip_address = hcloud_primary_ip.hnbg1-k-a-v4.ip_address
  dns_ptr = "a.k.nbg1.srv.duck.moe"
}

resource "hcloud_primary_ip" "hnbg1-k-a-v6" {
  name          = "hnbg1-k-a-priv6"
  datacenter    = "nbg1-dc3"
  type          = "ipv6"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_rdns" "hnbg1-k-a-v6" {
  primary_ip_id = hcloud_primary_ip.hnbg1-k-a-v6.id
  ip_address = cidrhost(hcloud_primary_ip.hnbg1-k-a-v6.ip_network, 1)
  dns_ptr = "a.k.nbg1.srv.duck.moe"
}