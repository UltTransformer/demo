# Variable Imports

data "aws_vpc" "vpc_1" {
  tags = {
    Name = "vpc_1"
  }
}
data "aws_subnet" "subnet_1" {
  tags = {
    Name = "subnet_1"
  }
}
