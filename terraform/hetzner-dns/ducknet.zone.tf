locals {
  ducknet_zone = {
    apex_wild_a = {
      name = "*"
      type = "A"
      ttl  = 43200
      value = "157.90.126.49"
    }
    apex_wild_aaaa = {
      name = "*"
      type = "AAAA"
      ttl  = 43200
      value = "2a01:4f8:1c1c:ebcc::1"
    }
    dev_wild_cname = {
      name = "*.dev"
      type = "CNAME"
      ttl  = 43200
      value = "ingress.konoha.srv.duck.moe."
    }
    git_wild_cname = {
      name = "*.git"
      type = "CNAME"
      ttl  = 600
      value = "ingress.konoha.srv.duck.moe."
    }
    home_wild_a = {
      name = "*.home"
      type = "CNAME"
      ttl  = 3600
      value = "home.theleachfamily.me.uk."
    }
    srv_kagepro_wild_cname = {
      name = "*.kagepro.srv"
      type = "CNAME"
      ttl  = 1800
      value = "ingress.kagepro.srv.duck.moe."
    }
    srv_konoha_wild_cname = {
      name = "*.konoha.srv"
      type = "CNAME"
      ttl  = 43200
      value = "konoha.srv.duck.moe."
    }
    apex_a = {
      name = "@"
      type = "A"
      ttl  = 43200
      value = "157.90.126.49"
    }
    apex_aaaa = {
      name = "@"
      type = "AAAA"
      ttl  = 43200
      value = "2a01:4f8:1c1c:ebcc::1"
    }
    dmarc_txt = {
      name = "_dmarc"
      type = "TXT"
      ttl  = 3600
      value = "\"v=DMARC1; p=reject; rua=mailto:me@duck.moe\""
    }
    matrix_tcp_srv = {
      name = "_matrix._tcp"
      type = "SRV"
      ttl  = 10800
      value = "10 5 443 matrix.duck.moe"
    }
    email_git_cname = {
      name = "email.git"
      type = "CNAME"
      ttl  = 86400
      value = "eu.mailgun.org."
    }

    files_cname = {
      name = "files"
      type = "CNAME"
      ttl  = 600
      value = "ingress.konoha.srv.duck.moe."
    }
    hypervisor_osaka_cname = {
      name = "hypervisor.osaka"
      type = "CNAME"
      ttl  = 600
      value = "osaka.srv.duck.moe."
    }
    hypervisor_osaka_srv_cname = {
      name = "hypervisor.osaka.srv"
      type = "CNAME"
      ttl  = 600
      value = "osaka.srv.duck.moe."
    }
    ingress_kagepro_srv_cname = {
      name = "ingress.kagepro.srv"
      type = "CNAME"
      ttl  = 1800
      value = "kido.srv.duck.moe."
    }
    kagepro_srv_cname = {
      name = "kagepro.srv"
      type = "CNAME"
      ttl  = 1800
      value = "orchestrator.kagepro.srv.duck.moe."
    }
    kido_master_nbg1_srv_a = {
      name = "kido.master.nbg1.srv"
      type = "A"
      ttl  = 600
      value = "157.90.126.49"
    }
    kido_master_nbg1_srv_aaaa = {
      name = "kido.master.nbg1.srv"
      type = "AAAA"
      ttl  = 600
      value = "2a01:4f8:1c1c:ebcc::1"
    }
    konoha_srv_a = {
      name = "konoha.srv"
      type = "A"
      ttl  = 43200
      value = "157.90.126.49"
    }
    konoha_srv_aaaa = {
      name = "konoha.srv"
      type = "AAAA"
      ttl  = 43200
      value = "2a01:4f8:1c1c:ebcc::1"
    }
    lyncdiscover_cname = {
      name = "lyncdiscover"
      type = "CNAME"
      ttl  = 3600
      value = "webdir.online.lync.com."
    }
    master_mekakushidan_cname = {
      name = "master.mekakushidan"
      type = "CNAME"
      ttl  = 1800
      value = "kido.master.nbg1.srv"
    }
    mc_allie_cname = {
      name = "mc.allie"
      type = "CNAME"
      ttl  = 1800
      value = "nagoya.srv.net.theleachfamily.me.uk."
    }
    mekakushidan_cname = {
      name = "mekakushidan"
      type = "CNAME"
      ttl  = 1800
      value = "kido.master.nbg1.srv"
    }
    nagoya_srv_cname = {
      name = "nagoya.srv"
      type = "CNAME"
      ttl  = 1800
      value = "nagoya.srv.net.theleachfamily.me.uk."
    }
    orchestrator_kagepro_srv_cname = {
      name = "orchestrator.kagepro.srv"
      type = "CNAME"
      ttl  = 1800
      value = "kido.srv.duck.moe."
    }
    orchestrator_shikoku_srv_cname = {
      name = "orchestrator.shikoku.srv"
      type = "CNAME"
      ttl  = 1800
      value = "tokushima.srv.duck.moe."
    }
    osaka_cname = {
      name = "osaka"
      type = "CNAME"
      ttl  = 43200
      value = "osaka.srv.duck.moe."
    }
    osaka_srv_a = {
      name = "osaka.srv"
      type = "A"
      ttl  = 43200
      value = "85.10.199.45"
    }
    osaka_srv_aaaa = {
      name = "osaka.srv"
      type = "AAAA"
      ttl  = 43200
      value = "2a01:4f8:a0:52cd::2"
    }
    paste_cname = {
      name = "paste"
      type = "CNAME"
      ttl  = 600
      value = "ingress.konoha.srv.duck.moe."
    }
    plex_cname = {
      name = "plex"
      type = "CNAME"
      ttl  = 1800
      value = "ingress.net.theleachfamily.me.uk."
    }
    rtun_a = {
      name = "rtun"
      type = "A"
      ttl  = 1800
      value = "88.97.102.182"
    }
    tasks_cname = {
      name = "tasks"
      type = "CNAME"
      ttl  = 600
      value = "ingress.konoha.srv.duck.moe."
    }
    znc_cname = {
      name = "znc"
      type = "CNAME"
      ttl  = 600
      value = "ingress.konoha.srv.duck.moe."
    }

    // net
    net_k8s_api_a = {
      name = "api.k8s.net"
      type = "A"
      ttl  = 3600
      value = var.dn_k8s_apiserver_ipv4
    }
    net_k8s_api_aaaa = {
      name = "api.k8s.net"
      type = "AAAA"
      ttl  = 3600
      value = var.dn_k8s_apiserver_ipv6
    }
  }

  office365_zone = {
    apex_spf_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"v=spf1 include:spf.protection.outlook.com include:spf.messagingengine.com -all\""
    }
    sip_cname = {
      name = "sip"
      type = "CNAME"
      ttl  = 3600
      value = "sipdir.online.lync.com."
    }
    sip_tls_srv = {
      name = "_sip._tls"
      type = "SRV"
      ttl  = 3600
      value = "100 1 443 sipdir.online.lync.com."
    }
    sipfederationtls_tcp_srv = {
      name = "_sipfederationtls._tcp"
      type = "SRV"
      ttl  = 3600
      value = "100 1 5061 sipfed.online.lync.com."
    }
    autodiscover_cname = {
      name = "autodiscover"
      type = "CNAME"
      ttl  = 3600
      value = "autodiscover.outlook.com."
    }
    enterpriseenrollment_cname = {
      name = "enterpriseenrollment"
      type = "CNAME"
      ttl  = 3600
      value = "enterpriseenrollment.manage.microsoft.com."
    }
    enterpriseregistration_cname = {
      name = "enterpriseregistration"
      type = "CNAME"
      ttl  = 3600
      value = "enterpriseregistration.windows.net."
    }
  }

  duck_me_uk_zone = {
    // Mail / O365
    apex_mx = {
      name = "@"
      type = "MX"
      ttl  = 3600
      value = "10 duck-me-uk.mail.protection.outlook.com."
    }
    // Verification keys
    apex_ms_1_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"MS=ms73929647\""
    }
    apex_keybase_verification_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"keybase-site-verification=3Se7tJU80o5ApePy1nNSoNA1p-_oc_meJU8ucuZRXo4\""
    }
  }
  duck_moe_zone = {
    // Mail / O365
    apex_wild_mx = {
      name = "*"
      type = "MX"
      ttl  = 3600
      value = "10 duck-moe.mail.protection.outlook.com."
    }
    apex_mx = {
      name = "@"
      type = "MX"
      ttl  = 3600
      value = "10 duck-moe.mail.protection.outlook.com."
    }
    selector1__domainkey_cname = {
      name = "selector1._domainkey"
      type = "CNAME"
      ttl  = 3600
      value = "selector1-duck-moe._domainkey.ducknet.onmicrosoft.com."
    }
    selector2__domainkey_cname = {
      name = "selector2._domainkey"
      type = "CNAME"
      ttl  = 3600
      value = "selector2-duck-moe._domainkey.ducknet.onmicrosoft.com."
    }

    // Verification keys
    apex_ms_1_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"MS=ms86934603\""
    }
    apex_ms_2_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"MS=ms92786489\""
    }
    apex_google_verification_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"google-site-verification=qx4upz3NPQC_qDxnsXssVgur-jJdsQTir8PQHj7H4kw\""
    }
    apex_keybase_verification_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"keybase-site-verification=PySDhKRXxvFtyMr7SRZvWoemPAySfBUoPQMit5KUgFo\""
    }
  }
  luaduck_co_uk_zone = {
    // Mail / O365
    apex_mx = {
      name = "@"
      type = "MX"
      ttl  = 3600
      value = "10 luaduck-co-uk.mail.protection.outlook.com."
    }
    selector1__domainkey_cname = {
      name = "selector1._domainkey"
      type = "CNAME"
      ttl  = 3600
      value = "selector1-luaduck-co-uk._domainkey.ducknet.onmicrosoft.com."
    }
    selector2__domainkey_cname = {
      name = "selector2._domainkey"
      type = "CNAME"
      ttl  = 3600
      value = "selector2-luaduck-co-uk._domainkey.ducknet.onmicrosoft.com."
    }

    // Verification keys
    apex_ms_1_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"MS=ms39960077\""
    }
    apex_keybase_verification_txt = {
      name = "@"
      type = "TXT"
      ttl  = 3600
      value = "\"keybase-site-verification=XWEW7gfExoKkqoN4nR9QKlF6TdEiCdMB4A6Dd835Qic\""
    }
  }

}

resource "hetznerdns_zone" "duck_moe" {
    name = "duck.moe"
    ttl = 3600
}

resource "hetznerdns_record" "duck_moe" {
  for_each = merge(local.ducknet_zone, local.office365_zone, local.duck_moe_zone)

  zone_id = hetznerdns_zone.duck_moe.id

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  value = each.value.value
}

resource "hetznerdns_zone" "duck_me_uk" {
    name = "duck.me.uk"
    ttl = 3600
}

resource "hetznerdns_record" "duck_me_uk" {
  for_each = merge(local.ducknet_zone, local.office365_zone, local.duck_me_uk_zone)

  zone_id = hetznerdns_zone.duck_me_uk.id

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  value = each.value.value
}

resource "hetznerdns_zone" "luaduck_co_uk" {
    name = "luaduck.co.uk"
    ttl = 3600
}

resource "hetznerdns_record" "luaduck_co_uk" {
  for_each = merge(local.ducknet_zone, local.office365_zone, local.luaduck_co_uk_zone)

  zone_id = hetznerdns_zone.luaduck_co_uk.id

  name   = each.value.name
  ttl    = each.value.ttl
  type   = each.value.type
  value = each.value.value
}

