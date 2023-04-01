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

variable "vpc_id" {
    description = "vpc id"
    type        = string
}

variable "sg_name" {
    description = "name of security group"
    type        = string
    default     = "allow_all"
}

variable "ingress_rule_from_port" {
    description = "ingress from port parameter"
    type        = number
    default     = 0
}

variable "ingress_rule_to_port" {
    description = "ingress to port parameter"
    type        = number
    default     = 65535
}

variable "ingress_rule_protocol" {
    description = "ingress protocol parameter"
    type        = string
    default     = "-1"
}

variable "ingress_rule_cidr_blocks" {
    description = "ingress cidr_blocks parameter"
    type        = list(string)
    default     = ["0.0.0.0/0"]
}

### egress rule

variable "egress_rule_from_port" {
    description = "egress from port parameter"
    type        = number
    default     = 0
}

variable "egress_rule_to_port" {
    description = "egress to port parameter"
    type        = number
    default     = 65535
}

variable "egress_rule_protocol" {
    description = "egress protocol parameter"
    type        = string
    default     = "-1"
}

variable "egress_rule_cidr_blocks" {
    description = "egress cidr_blocks parameter"
    type        = list(string)
    default     = ["0.0.0.0/0"]
}