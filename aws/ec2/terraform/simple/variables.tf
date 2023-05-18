# Variables file

variable "region" {
  type    = string
  default = "eu-north-1a"
}

variable "ec2-instance-name" {
  type    = string
  default = "CHANGE ME"
}

variable "security-group-name" {
  type    = string
  default = "CHANGE ME"
}

variable "ec2_instance_size" {
  type    = string
  default = "t3.micro"
}

variable "ingress_sg_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "egress_sg_cidr" {
  type    = string
  default = "10.10.0.0/16"
}
