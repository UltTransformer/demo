# Customer change 8/4 07:42

# Provider

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "remote" {
    organization = "ChrisNoonPlayground"
    workspaces {
      name = "demo"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
  assume_role_with_web_identity {
    role_arn                = "{arn:aws:iam::176620772543:role/env0_oidc_role}"
    session_name            = "env0_OIDC_session"
    web_identity_token_file = "env0-oidc-token.txt"
  }
}

# Bucket

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
