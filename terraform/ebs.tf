# kubectl create secret generic aws-secret \
#     --namespace kube-system \
#     --from-literal "key_id=AKIAV7XYFHRFB4KV7H4B" \
#     --from-literal "access_key=Miy/gbFT/GFdnfSq/Wiz3K81MvFq7PkVRvKKw2Wt"

resource "null_resource" "storage-class" {
  depends_on = [module.cluster]

  provisioner "local-exec" {
    command = <<-EOT
    kubectl --kubeconfig admin.conf apply -f sc.yaml
    EOT
  }
}