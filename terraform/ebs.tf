resource "null_resource" "storage-class" {
  depends_on = [module.cluster]

  provisioner "local-exec" {
    command = <<-EOT
    kubectl --kubeconfig admin.conf apply -f sc.yaml
    EOT
  }
}