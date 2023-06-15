# Generate remote backend for child workspaces.

generate "backend" {
  path      = "remote_backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "cn-env0-statefile-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}
EOF
}

# Comment out when working locally.

generate "aws_provider" {
  path      = "aws_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
 terraform {
   required_providers {
     aws = {
       source = "hashicorp/aws"
     }
   }
 }

 provider "aws" {
   region     = "eu-north-1"
 }
EOF
}

