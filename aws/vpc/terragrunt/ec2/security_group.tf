resource "aws_security_group" "security_group" {
  name   = var.security-group-name
  vpc_id = ""

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ingress_sg_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.egress_sg_cidr]
  }
}
