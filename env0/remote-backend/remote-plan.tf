terraform {
  backend "remote" {
    hostname     = "backend.api.env0.com"
    organization = "[Org ID].[Project ID]"
    workspaces {
      name = "[workspaceName]"
    }
  }
}