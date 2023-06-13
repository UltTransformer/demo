# Remote backend

terraform {
  backend "remote" {
    organization = "ChrisNoonPlayground"
    workspaces {
      name = "demo"
    }
  }
}

# terraform {
#   backend "remote" {
#     hostname = "backend.api.env0.com"
#     organization = "a25b6a59-9c48-4917-b082-68e985319a87"
#     workspaces {
#       name = "demo"
#     }
#   }
# }