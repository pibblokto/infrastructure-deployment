### Cluster ###demo_eks

resource "aws_eks_cluster" "main_eks" {
 name               = var.cluster_name
 role_arn           = var.eks_iam_role_arn
 version            = var.kube_version
 vpc_config {
  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access
  subnet_ids              = var.subnet_ids
 }
}