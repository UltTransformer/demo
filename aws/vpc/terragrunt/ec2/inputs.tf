# Variable Imports

data "aws_vpc" "vpc_1" {
  tags = {
    Name   = "vpc_1"
  }
}
data "aws_subnet" "subnet_1" {
  tags = {
    Name   = "subnet_1"
  }
}

data "aws_subnet" "subnet_2" {
  id = data.terraform_remote_state.vpc.outputs.subnet_2
}
data "aws_subnet" "subnet_3" {
  id = data.terraform_remote_state.vpc.outputs.subnet_3
}
