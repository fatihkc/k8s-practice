provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = "./admin.conf"
  config_context = "kubernetes-admin@kubernetes"
}

provider "helm" {
  kubernetes {
    config_path    = "./admin.conf"
    config_context = "kubernetes-admin@kubernetes"
  }
}