# Provider
# Customer Demo 6/20 19:42

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      access_key = data.aws_secretsmanager_id_version.current.secret_binary
      secret_key = data.aws_secretsmanager_secret_version.current.secret_binary
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

# Pull secrets
# Key
data "aws_secretsmanager_id" "AWS_ACCESS_KEY_ID" {
  arn = "arn:aws:secretsmanager:eu-north-1:176620772543:secret:AWS_ACCESS_KEY_ID-zD07gd"
}
data "aws_secretsmanager_id_version" "current" {
  secret_id = data.aws_secretsmanager_id.AWS_ACCESS_KEY_ID.id
}

# Secret
data "aws_secretsmanager_secret" "AWS_SECRET_ACCESS_KEY" {
  arn = "arn:aws:secretsmanager:eu-north-1:176620772543:secret:AWS_SECRET_ACCESS_KEY-zD07gd"
}
data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.AWS_SECRET_ACCESS_KEY.id
}