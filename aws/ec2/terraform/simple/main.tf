# Provider
# Customer Demo 6/21 14:51

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

# Image(s)

data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20211001.1-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"] # Canonical
}

# Security Group(s)

resource "aws_security_group" "security_group" {
  name   = var.security-group-name
  vpc_id = data.aws_vpc.vpc_1.id

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

# EC2

# instance 1

resource "aws_network_interface" "ec2_1" {
  subnet_id = data.aws_subnet.subnet_1.id
  security_groups = [
    aws_security_group.security_group.id,
  ]
}

resource "aws_instance" "ec2_1" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = var.ec2_instance_size
  availability_zone = var.region

  network_interface {
    network_interface_id = aws_network_interface.ec2_1.id
    device_index         = 0
  }
  tags = {
    Name = var.ec2-instance-name
  }
}

