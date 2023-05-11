terraform {
  backend "remote" {
    hostname     = "backend.api.env0.com"
    organization = "[Organization ID].[Project ID]"
    workspaces {
      name = "95601267507692527960592"
      workspaceName = "aws-s3-bucket-remote-plan"
    }
  }
}