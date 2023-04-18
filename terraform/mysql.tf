resource "null_resource" "initdb" {
  depends_on = [module.cluster]

  provisioner "local-exec" {
    command = <<-EOT
    kubectl --kubeconfig admin.conf create ns app
    kubectl --kubeconfig admin.conf apply -f initdb.yml
    EOT
  }
}

resource "helm_release" "mysql" {
  depends_on = [
     null_resource.initdb,
     null_resource.storage-class,
  ]

  name             = "mysql"
  namespace        = "app"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mysql"
  version          = var.mysql-version
  create_namespace = true
  atomic           = true
  set {
    name  = "persistence.storageClass"
    value = "ebs-gp3"
  }
  set {
    name  = "initdbScriptsConfigMap"
    value = "init"
  } 
}

