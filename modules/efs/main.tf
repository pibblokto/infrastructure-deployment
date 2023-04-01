resource "aws_efs_file_system" "efs" {
  creation_token = "${var.cluster_name}-token"

  tags = {
    Name = "${var.environment}-efs"
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.private_subnet_id
  security_groups = var.security_groups
}
