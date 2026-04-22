locals {
    hetzner_nameservers = [
        "helium.ns.hetzner.de.",
        "hydrogen.ns.hetzner.com.",
        "oxygen.ns.hetzner.com.",
    ]
}

resource "porkbun_domain_nameservers" "ducknet" {
  for_each = toset(["duck.moe", "duck.me.uk", "luaduck.co.uk"])
  domain     = each.key
  nameservers = local.hetzner_nameservers
}
