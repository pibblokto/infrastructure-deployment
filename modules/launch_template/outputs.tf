output "launch_template_id" {
    value = aws_launch_template.cluster_node.id
}

output "latest_version" {
    value = aws_launch_template.cluster_node.latest_version
}