data "aws_ami" "eks-amazon-linux" {
 most_recent = true

 filter {
   name   = "name"
   values = ["amazon-eks-node-1.24*"] # amazon-eks-node-1.24-v20230127
 }

}

resource "aws_launch_template" "cluster_node" {
  name                   = var.launch_template_name
  instance_type          = var.instance_type
  image_id               = data.aws_ami.eks-amazon-linux.id
  key_name               = var.key_name
  vpc_security_group_ids = [ var.additional_sg_id, var.eks_sg_id ]
  user_data              = base64encode(templatefile("./script/mount_efs.sh", 
                          {DNS = var.mount_target_dns_name,
                          CLUSTER_NAME = var.eks_cluster_name}))
  block_device_mappings {
    device_name = var.block_device_mapping_device_name

    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.environment}-eks-node-launch-template"
    }
  }
}