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

variable "node_group_role_arn" {
    description = "node group arn"
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

variable "node_group_name" {
  description = "name of node group"
  type        = string
  default     = "main-node-group"
}

variable "launch_template_id" {
  description = "id of launch template"
  type        = string
}

variable "launch_template_version" {
  description = "version of launch template"
  type        = string
}

variable "max_unavailable" {
  type        = number
  description = "max unavailable amount of nodes"
  default     = 3
}

variable "desired_size" {
  type        = number
  description = "desired amount of nodes"
  default     = 3
}

variable "max_size" {
  type        = number
  description = "max amount of nodes"
  default     = 3
}

variable "min_size" {
  type        = number
  description = "min amount of nodes"
  default     = 3
}