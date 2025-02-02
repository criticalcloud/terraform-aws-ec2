resource "aws_security_group" "sg" {
  name        = "ec2-${var.client_name}-${var.environment}"
  description = "SG EC2 ${var.client_name}-${var.environment}"
  vpc_id      = var.vpc_id

  tags = {
    Name   = "ec2-${var.client_name}-${var.environment}"
    backup = "${var.tag}"
  }
}

resource "aws_security_group_rule" "ingress_tcp" {
  for_each          = toset(var.ingress_ports)
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = var.cdirs_acesso
  security_groups   = var.sgs_acesso
}

resource "aws_security_group_rule" "ingress_udp" {
  for_each          = toset(var.ingress_ports)
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "udp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = var.cdirs_acesso
  security_groups   = var.sgs_acesso
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}
