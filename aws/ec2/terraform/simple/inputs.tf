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

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}