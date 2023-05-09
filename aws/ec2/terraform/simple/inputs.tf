# env0 remote backend

data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    hostname     = "backend.api.env0.com"
    organization = "a25b6a59-9c48-4917-b082-68e985319a87"
    workspaces = {
      name = "demo-vpc"
    }
  }
}

data "aws_vpc" "vpc_1" {
  id = data.terraform_remote_state.vpc.outputs.vpc_id.id
}
data "aws_subnet" "subnet_1" {
  id = data.terraform_remote_state.vpc.outputs.subnet_1.id
}
# data "aws_subnet" "subnet_2" {
#   id = data.terraform_remote_state.vpc.outputs.subnet_2.id
# }
# data "aws_subnet" "subnet_3" {
#   id = data.terraform_remote_state.vpc.outputs.subnet_3.id
# }

# output "vpc_id" {
#   value = data.terraform_remote_state.vpc.outputs.vpc_id
# }