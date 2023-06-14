# Variables file

variable "ec2_instance_size" {
  type    = string
  default = "t3.micro"
}

variable "ec2_name" {
  type    = string
  default = "change-me"
}

variable "region" {
  type    = string
  default = "eu-north-1a"
}

variable "ingress_sg_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "egress_sg_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "security-group-name" {
  type = string
}

variable "ec2-instance-name" {
  type = string
}
