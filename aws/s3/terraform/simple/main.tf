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
