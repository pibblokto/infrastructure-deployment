resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allow all ingress traffic for EKS nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.environment}-allow-all"
  }
}


resource "aws_security_group_rule" "allow_all_ingress" {
  type              = "ingress"
  from_port         = var.ingress_rule_from_port
  to_port           = var.ingress_rule_to_port
  protocol          = var.ingress_rule_protocol
  cidr_blocks       = var.ingress_rule_cidr_blocks
  security_group_id = aws_security_group.allow_all.id
}

resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  from_port         = var.egress_rule_from_port
  to_port           = var.egress_rule_to_port
  protocol          = var.egress_rule_protocol
  cidr_blocks       = var.egress_rule_cidr_blocks
  security_group_id = aws_security_group.allow_all.id
}