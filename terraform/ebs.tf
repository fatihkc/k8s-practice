# resource "null_resource" "aws-secret" {
#   depends_on = [module.cluster]

#   provisioner "local-exec" {
#     command = <<-EOT
#     kubectl --kubeconfig admin.conf create secret generic aws-secret --namespace kube-system --from-literal "key_id= " --from-literal "access_key= "
#     EOT
#   }
# }

resource "helm_release" "ebs" {
  depends_on = [
     null_resource.aws-secret,
  ]

  name             = "aws-ebs-csi-driver"
  namespace        = "kube-system"
  repository       = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart            = "aws-ebs-csi-driver"
  version          = "2.18.0"
  atomic           = true
}


resource "null_resource" "storage-class" {
  depends_on = [helm_release.ebs]

  provisioner "local-exec" {
    command = <<-EOT
    kubectl --kubeconfig admin.conf apply -f sc.yaml
    EOT
  }
}