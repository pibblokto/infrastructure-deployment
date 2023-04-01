data "aws_ami" "amazon-linux-2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

resource "aws_iam_instance_profile" "main_profile" {
  name = var.instance_profile_name
  role = var.ecr_role_name
}

resource "aws_instance" "ansible_bastion" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
  iam_instance_profile        = aws_iam_instance_profile.main_profile.id
  vpc_security_group_ids      = [var.eks_sg_id, var.additional_sg_id]
  user_data                   = templatefile("./script/ansible_bastion_setup.sh", 
                                { CLUSTER_NAME = var.cluster_name })
  tags = {
    Name = "${var.environment}-ansible-bastion"
  }
}

