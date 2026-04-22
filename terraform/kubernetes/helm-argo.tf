resource "helm_release" "argo-cd" {
 depends_on = [helm_release.flannel, helm_release.coredns]
 name       = "argo-cd"
 repository = "https://argoproj.github.io/argo-helm"
 chart      = "argo-cd"
 version    = "7.7.11"

 namespace = "argo-cd"

 create_namespace = true

 # Manifest management is provided by argo after initialisation - bootstrapping only.
 lifecycle {
   ignore_changes = all
 }
}