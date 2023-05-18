# Provider

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  // Remove block
  # backend "remote" {
  #   organization = "ChrisNoonPlayground"
  #   workspaces {
  #     name = "demo"
  #   }
  # }
  backend "remote" {
    hostname     = "backend.api.env0.com"
    organization = "a25b6a59-9c48-4917-b082-68e985319a87"
    workspaces {
      name = "demo"
    }
  }
  // Remove block
}

provider "aws" {
  region = "eu-north-1"
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
