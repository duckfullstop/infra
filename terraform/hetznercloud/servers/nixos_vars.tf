resource "local_file" "nixos_vars" {
  content         = jsonencode(local.nixos_vars)
  filename        = var.nixos_vars_file
  file_permission = "600"

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "git add -f '${var.nixos_vars_file}'"
  }
}