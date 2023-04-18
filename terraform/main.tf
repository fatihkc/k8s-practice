module "network" {
  source = "../modules/modules/network"
  cidr_block = "10.0.0.0/16"
  tags       = { "terraform-kubeadm:cluster" = module.cluster.cluster_name }
}

module "cluster" {
  source = "../modules"
  vpc_id                 = module.network.vpc_id
  subnet_id              = module.network.subnet_id
  cluster_name           = "k8s-practice"
  num_workers            = 1
  kubeconfig_file        = "admin.conf"
  pod_network_cidr_block = "10.244.0.0/16"
  master_instance_type  = "t3.medium"
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