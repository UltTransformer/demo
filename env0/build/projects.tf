resource "env0_project" "build-production" {
  name        = "build-Production"
  description = "build-Production"
}

resource "env0_project" "build-stage" {
  name        = "build-Stage"
  description = "build-Stage"
}

resource "env0_project" "S3" {
  name        = "S3"
  description = "S3"
  parent_project_id = value.env0_project.build-production.parent_project_id
}