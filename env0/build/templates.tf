resource "env0_template" "build-template" {
  name                   = "build-template"
  description            = "TF built template"
  repository             = "https://github.com/UltTransformer/demo"
  terraform_version      = "1.1.9"
  github_installation_id = 27876397
}