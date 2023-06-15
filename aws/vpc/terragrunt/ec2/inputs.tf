# Variable Imports

data "aws_vpc" "vpc_1" {
  default = "1234567890"
  tags = {
    Name   = "vpc_1"
  }
}
data "aws_subnet" "subnet_1" {
  default = "1234567890"
  tags = {
    Name   = "subnet_1"
  }
}