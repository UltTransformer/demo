# Remote backend

# terraform {
#   backend "s3" {
#     bucket = "cn-env0-statefile-bucket"
#     key    = "s3.tfstate"
#     region = "eu-north-1"
#   }
# }

terraform {
  backend "remote" {
    hostname = "backend.api.env0.com"
    organization = "a25b6a59-9c48-4917-b082-68e985319a87.7d4afe47-cc34-4d6e-86df-fe030c699a51"
    workspaces {
      name = "demo-vpc"
    }
  }
}