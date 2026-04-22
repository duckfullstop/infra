resource "helm_release" "flannel" {
 name       = "flannel"
 repository = "https://flannel-io.github.io/flannel/"
 chart      = "flannel"
 version    = "v0.26.2"

 namespace = "kube-flannel"

 create_namespace = true

 set {
   name  = "podCidr"
   value = "172.24.0.0/16"
 }
 set {
   name  = "podCidrv6"
   value = "fc00:abc1::/48"
 }
}

resource "helm_release" "coredns" {
 depends_on = [helm_release.flannel]
 name       = "coredns"
 repository = "https://coredns.github.io/helm"
 chart      = "coredns"
 version    = "1.37.0"

 namespace = "kube-system"

 create_namespace = false
 force_update = true

 set {
   name  = "service.clusterIP"
   value = "fc00:abc0::254"
 }
}

resource "helm_release" "sealed-secrets" {
 depends_on = [helm_release.flannel, helm_release.coredns]
 name       = "sealed-secrets"
 repository = "https://bitnami-labs.github.io/sealed-secrets"
 chart      = "sealed-secrets"
 version    = "2.17.0"

 namespace = "kube-system"

 create_namespace = false
}

resource "helm_release" "gateway" {
 name       = "gateway-api"
 repository = "https://charts.appscode.com/stable/"
 chart      = "gateway-api"
 version    = "v2024.8.30"

 namespace = "kube-system"

 create_namespace = false
}