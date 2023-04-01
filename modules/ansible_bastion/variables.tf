variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "account id"
  type        = string
  default     = "056201179630"
}

variable "instance_profile_name" {
  description = "name of instance profile"
  type        = string
  default     = "ansible-instance-profile"
}

variable "ecr_role_name" {
  description = "name of role for ecr access"
  type        = string
}

variable "cluster_name" {
    description = "name of eks cluster"
    type        = string
}

variable "instance_type" {
    description = "ec2 instance type"
    type        = string
    default     = "t2.micro"
}

variable "associate_public_ip_address" {
    description = "Whether to asscociate public ip address"
    type        = bool
    default     = true
}

variable "key_name" {
    description = "private key for ssh"
    type        = string
    default     = "test_key"
}

variable "public_subnet_id" {
    description = "id of any public subnet"
    type        = string
}

variable "eks_sg_id" {
    description = "id of eks-generated security group"
    type        = string
}

variable "additional_sg_id" {
    description = "id of additional security group"
    type        = string
}