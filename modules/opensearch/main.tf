resource "aws_opensearch_domain" "domain" {
  domain_name           = var.opensearch_domain_name

  cluster_config {
    instance_type  = var.instance_type
    instance_count = var.instance_count
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption
  }

  domain_endpoint_options {
    enforce_https = var.enforce_https
    tls_security_policy = var.tls_security_policy
  }

  encrypt_at_rest {
    enabled = var.encrypt_at_rest
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.volume_size
  }

  advanced_security_options {
    enabled                         = var.advanced_security_options_enabled
    internal_user_database_enabled  = var.internal_user_database_enabled
    master_user_options {
        master_user_name     = var.opensearch_username
        master_user_password = var.opensearch_password
    }
  }

  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:${var.region}:056201179630:domain/${var.opensearch_domain_name}/*"
    }
  ]
}
CONFIG

  tags = {
    Name = "${var.environment}-opensearch-domain"
  }
}