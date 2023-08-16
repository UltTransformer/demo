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
    organization = "a25b6a59-9c48-4917-b082-68e985319a87.ba6173ab-0637-4108-a6d7-2c3c414ad727"
    workspaces {
      name = "demo-vpc"
    }
  }
}