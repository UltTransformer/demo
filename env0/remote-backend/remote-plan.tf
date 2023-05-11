terraform {
  backend "remote" {
    hostname     = "backend.api.env0.com"
    # organization = "[Org ID].[Project ID]"
    workspaces {
      name = "c39c934bcx02nx0n2e"
    }
  }
}