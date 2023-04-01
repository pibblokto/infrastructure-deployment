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

variable "kube_version" {
    description = "kubernetes version"
    type        = string
    default     = "1.24"
}

variable "eks_iam_role_arn" {
    description = "eks iam role arn"
    type        = string
}

variable "endpoint_private_access" {
  type        = bool
  description = "Whether to enable private access"
  default     = true
}

variable "endpoint_public_access" {
  type        = bool
  description = "Whether to enable public access"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids"
}
