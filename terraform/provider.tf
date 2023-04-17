provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path    = "./admin.conf"
  config_context = "my-context"
}