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

variable "secret_manager_role" {
  description = "secret manager role arn"
  type        = string
}

variable "ingress_controller_role" {
  description = "ingress controller role arn"
  type        = string
}

variable "cluster_name" {
  description = "name of eks cluster"
  type        = string
}