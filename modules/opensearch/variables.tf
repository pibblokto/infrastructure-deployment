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
    type        = string
    description = "domain name of opensearch"
    default     = "demo"
}

variable "instance_type" {
    type        = string
    description = "type of instances for opensearch cluster"
    default     = "t3.small.search"
}

variable "instance_count" {
    type        = number
    description = "number of instances for opensearch cluster"
    default     = 3
}

variable "node_to_node_encryption" {
    type        = bool
    description = "Whether to enabled node to node encryption"
    default     = true
}

variable "enforce_https" {
    type        = bool
    description = "Whether to enforce https"
    default     = true
}

variable "tls_security_policy" {
    type        = string
    description = "tls security policy"
    default     = "Policy-Min-TLS-1-0-2019-07"
}

variable "encrypt_at_rest" {
    type        = bool
    description = "Whether to ecnrypt at rest"
    default     = true
}

variable "ebs_enabled" {
    type        = bool
    description = "Whether ebs is enabled"
    default     = true
}

variable "volume_size" {
    type        = number
    description = "EBS volume size"
    default     = 10
}

variable "advanced_security_options_enabled" {
    type        = bool
    description = "Whether advanced security options are enabled"
    default     = true
}

variable "internal_user_database_enabled" {
    type        = bool
    description = "Whether internal user database is enabled"
    default     = true
}

variable "opensearch_username" {
    type        = string
    description = "Opensearch username"
    default     = "User" # Should not be used
}

variable "opensearch_password" {
    type        = string
    description = "Opensearch password" 
    default     = "Qwerty12345678@"    # Should not be used
}