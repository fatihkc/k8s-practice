resource "helm_release" "mysql" {
  depends_on = [
     null_resource.storage-class,
  ]

  name             = "mysql"
  namespace        = "mysql"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mysql"
  version          = var.mysql-version
  create_namespace = true
  atomic           = true
  set {
    name  = "persistence.storageClass"
    value = "local-storage"
  }
}