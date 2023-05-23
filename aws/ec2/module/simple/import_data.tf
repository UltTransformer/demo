# Importing data from existing vpc

data "aws_subnet" "subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["subnet_1"]
  }
}

data "aws_subnet" "subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["subnet_2"]
  }
}

data "aws_vpc" "vpc_1" {
  filter {
    name   = "tag:Name"
    values = ["vpc_1"]
  }
}

# data "terraform_remote_state" "vpc" {
#   backend = "remote"
#   config = {
#     hostname     = "backend.api.env0.com"
#     organization = "a25b6a59-9c48-4917-b082-68e985319a87"
#     workspaces = {
#       name = "demo-vpc"
#     }
#   }
# }

# output "vpc_1" {
#   value = data.aws_vpc.vpc_1.id 
# }
# output "subnet_1" {
#   value = data.terraform_remote_state.vpc.outputs.subnet_1
# }
# output "subnet_2" {
#   value = data.terraform_remote_state.vpc.outputs.subnet_2
# }