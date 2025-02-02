resource "aws_security_group" "sg" {
  name        = "ec2-${var.client_name}-${var.environment}"
  description = "SG EC2 ${var.client_name}-${var.environment}"
  vpc_id      = var.vpc_id
  tags = {
    Name   = "ec2-${var.client_name}-${var.environment}"
    backup = "${var.tag}"
  }
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}
