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

variable "mount_target_dns_name" {
    description = "efs mount target dns name"
    type        = string
}

variable "eks_cluster_name" {
    description = "name of eks cluster"
    type        = string
}

variable "launch_template_name" {
    description = "name of launch template"
    type        = string
    default     = "eks_node_launch_template"
}

variable "instance_type" {
    description = "instance type"
    type        = string
    default     = "t2.medium"
}

variable "key_name" {
    description = "name of the key"
    type        = string
    default     = "test_key"
}

variable "eks_sg_id" {
    description = "id of eks-generated security group"
    type        = string
}

variable "additional_sg_id" {
    description = "id of additional security group"
    type        = string
}

variable "block_device_mapping_device_name" {
    description = "device of block device"
    type        = string
    default     = "/dev/xvda"
}

variable "volume_size" {
    description = "volume size"
    type        = number
    default     = 20
}

variable "volume_type" {
    description = "volume type"
    type        = string
    default     = "gp2"
}