// This module is responsible SOLELY for bootstrapping the cluster with things like networking.
// Further deployment of apps, etc. is performed by argocd.

provider "helm" {
  kubernetes {
    host = "https://apiserver.k8s.net.duck.moe:6443"

    client_certificate     = var.client_cert
    client_key             = var.client_key
    cluster_ca_certificate = var.ca_cert
  }
}

provider "kubernetes" {
  host = "https://apiserver.k8s.net.duck.moe:6443"

  client_certificate     = var.client_cert
  client_key             = var.client_key
  cluster_ca_certificate = var.ca_cert
}