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

variable "opensearch_domain_name" {
  description = "opensearch domain name"
  type        = string
}

variable "issuer" {
    description = "should be provided from aws_eks_cluster.cluster.identity[0].oidc[0].issuer"
    type        = string
}

variable "secret_manager_role_name" {
    description = "name of secret manager role name"
    type        = string
    default     = "SecretManagerRole"
}

variable "alb_controller_role_name" {
    description = "name of alb controller role"
    type        = string
    default     = "aws-load-balancer-controller"
}

variable "lambda_role_name" {
    description = "name of lambda role"
    type        = string
    default     = "LambdaIAMExecutionRole"
}