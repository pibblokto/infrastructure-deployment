### Worker Nodes ###
resource "null_resource" "update_kubeconfig" {
  
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.cluster_name}"
  }
}

resource "aws_eks_node_group" "worker_node_group" {
  cluster_name              = var.cluster_name
  node_group_name           = var.node_group_name
  node_role_arn             = var.node_group_role_arn
  subnet_ids                = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  scaling_config {
   desired_size = var.desired_size
   max_size     = var.max_size
   min_size     = var.min_size
  }
}