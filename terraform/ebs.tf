# kubectl create secret generic aws-secret \
#     --namespace kube-system \
#     --from-literal "key_id=${AWS_ACCESS_KEY_ID}" \
#     --from-literal "access_key=${AWS_SECRET_ACCESS_KEY}"

resource "null_resource" "storage-class" {
  depends_on = [module.cluster]

  provisioner "local-exec" {
    command = <<-EOT
    kubectl --kubeconfig admin.conf apply -f sc.yaml
    EOT
  }
}