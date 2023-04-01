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

variable "cluster_name" {
    description = "name of eks cluster"
    type        = string
}

variable "private_subnet_id" {
    description = "id of private subnet for target group"
    type        = string
}

variable "security_groups" {
    description = "list of secutity groups for efs"
    type        = list(string)
}