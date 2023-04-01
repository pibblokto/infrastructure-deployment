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

variable "eks_iam_role_name" {
    description = "name of eks iam role"
    type        = string
    default     = "eks_iam_role"
}

variable "worker_node_role_name" {
    description = "name of eks worker node role"
    type        = string
    default     = "worker_node_role"
}
