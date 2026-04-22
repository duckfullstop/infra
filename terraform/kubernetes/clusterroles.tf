resource "kubernetes_manifest" "clusterrolebinding_oidc_cluster_admin_groups" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "name" = "oidc-cluster-admin-groups"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "cluster-admin"
    }
    "subjects" = [
      {
        "apiGroup" = "rbac.authorization.k8s.io"
        "kind" = "Group"
        "name" = "oidc:Superusers"
      },
      {
        "apiGroup" = "rbac.authorization.k8s.io"
        "kind" = "Group"
        "name" = "oidc:ducknet_ops"
      },
    ]
  }
}