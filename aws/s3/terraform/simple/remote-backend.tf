# Remote backend

# terraform {
#   backend "s3" {
#     bucket = "cn-env0-statefile-bucket"
#     key    = "s3.tfstate"
#     region = "eu-north-1"
#   }
# }

# terraform {
#   backend "remote" {
#     hostname = "backend.api.env0.com"
#     organization = "a25b6a59-9c48-4917-b082-68e985319a87.d9a947b9-2e16-4004-a5f2-7d2f4b686444"
#     workspaces {
#       name = "demo-s3"
#     }
#   }
# }