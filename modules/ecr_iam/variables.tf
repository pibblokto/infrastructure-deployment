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

variable "ecr_iam_role_name" {
    description = "name of eks iam role"
    type        = string
    default     = "ecr_iam_role"
}
