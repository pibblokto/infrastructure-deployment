output "ecr_iam_role_arn" {
    value = aws_iam_role.ecr_role.arn
}

output "ecr_iam_role_name" {
    value = aws_iam_role.ecr_role.name
}