module "aws-ec2-module-simple" {
  source = "api.env0.com/a25b6a59-9c48-4917-b082-68e985319a87/aws-ec2-module-simple/awsec2modulesimple"
  version = "1.0.0"
}

variable "security-group-name" {
  type = string
  default = "vm1"
}

variable "ec2-instance-name" {
  type = string
  default = "vm1-sg"
}