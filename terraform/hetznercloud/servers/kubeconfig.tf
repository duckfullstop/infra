data "external" "kubeconfig" {
  depends_on = [
    hcloud_server.nbg1-k-a
  ]

  program = [
    "/usr/bin/ssh",
    "-o UserKnownHostsFile=/dev/null",
    "-o StrictHostKeyChecking=no",
    "root@${hcloud_server.nbg1-k-a.ipv4_address}",
    "echo '{\"client_cert\":\"'$(sudo cat /var/lib/kubernetes/secrets/cluster-admin.pem | base64)'\",\"client_key\":\"'$(sudo cat /var/lib/kubernetes/secrets/cluster-admin-key.pem | base64)'\",\"cacert\":\"'$(sudo cat /var/lib/kubernetes/secrets/ca.pem | base64)'\"}'"
  ]
}