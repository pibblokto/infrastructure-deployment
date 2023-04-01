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

variable "vpc_range" {
    type        = string
    description = "vpc ip range" 
}

variable "public_subnets" {
    type        = list(string)
    description = "public subnets" 
}

variable "private_subnets" {
    type        = list(string)
    description = "private subnets" 
}
