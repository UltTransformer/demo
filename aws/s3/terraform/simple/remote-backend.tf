terraform {
  backend "s3" {
    bucket = "cn-env0-statefile-bucket"
    key    = "vpc.tfstate"
    region = "eu-north-1"
  }
}