resource "kubernetes_secret" "hetzner-apikey" {
  metadata {
    name = "hcloud-api"
    namespace = "kube-system"
  }

  data = {
    token = var.hetzner_cluster_apikey
  }
}

resource "helm_release" "hetzner-csi" {
 depends_on = [helm_release.flannel, helm_release.coredns, kubernetes_secret.hetzner-apikey]
 name       = "hcloud-csi"
 repository = "https://charts.hetzner.cloud"
 chart      = "hcloud-csi"
 version    = "v2.11.0"

 namespace = "kube-system"

 create_namespace = false

 set {
   name  = "controller.hcloudToken.existingSecret.name"
   value = kubernetes_secret.hetzner-apikey.metadata[0].name
 }
 set {
    name = "storageClasses[0].name"
    value = "hcloud-volumes"
 }
 set {
    name = "storageClasses[0].defaultStorageClass"
    value = true
 }
 set {
    name = "storageClasses[0].reclaimPolicy"
    value = "Retain"
 }
}
