module "network" {
  source     = "weibeld/kubeadm/aws//modules/network"
  version    = "~> 0.2"
  cidr_block = "10.0.0.0/16"
  tags       = { "terraform-kubeadm:cluster" = module.cluster.cluster_name }
}

module "cluster" {
  source    = "weibeld/kubeadm/aws"
  version   = "~> 0.2"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
  cluster_name = "k8s-practice"
  num_workers = 1
  kubeconfig_file = "admin.conf"
  pod_network_cidr_block = "10.244.0.0/16"
}

resource "null_resource" "flannel" {
  depends_on = [module.cluster]

  provisioner "local-exec" {
    command = <<-EOT
    sleep 45
    kubectl --kubeconfig admin.conf apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
    EOT
  }
}