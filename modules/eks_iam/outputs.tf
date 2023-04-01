output "worker_node_role_arn" {
    value = aws_iam_role.worker_nodes.arn
}

output "eks_iam_role_arn" {
    value = aws_iam_role.eks_iam_role.arn
}