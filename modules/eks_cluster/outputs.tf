# specify cluster name output
output "cluster_name" {
    value = aws_eks_cluster.main_eks.name
}

output "issuer" {
    value = aws_eks_cluster.main_eks.identity[0].oidc[0].issuer
}

output "cluster_security_group_id" {
    value = aws_eks_cluster.main_eks.vpc_config[0].cluster_security_group_id
}
