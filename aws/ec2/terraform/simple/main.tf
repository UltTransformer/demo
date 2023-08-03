# Provider
# Customer Demo ##/## ##:##

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

# Module call

module "aws-ec2-module-simple" {
  source = "api.env0.com/a25b6a59-9c48-4917-b082-68e985319a87/aws-ec2-module-simple/awsec2modulesimple"
  version = "1.0.1"
}