# Root projects

resource "env0_project" "build-production" {
  name        = "build-Production"
  description = "build-Production"
}

resource "env0_project" "build-stage" {
  name        = "build-Stage"
  description = "build-Stage"
}

# Sub Projects

resource "env0_project" "S3" {
  name        = "S3"
  description = "S3"
  parent_project_id = "8bcbf954-c080-453f-85a0-4502c3f0676e"
}

resource "env0_project" "VPC" {
  name        = "VPC"
  description = "VPC"
  parent_project_id = "8bcbf954-c080-453f-85a0-4502c3f0676e"
}

resource "env0_project" "EC2" {
  name        = "EC2"
  description = "EC2"
  parent_project_id = "8bcbf954-c080-453f-85a0-4502c3f0676e"
}

resource "env0_project" "S3" {
  name        = "S3"
  description = "S3"
  parent_project_id = "a1fa2857-48f1-496a-8639-a2dcc36688ae"
}

resource "env0_project" "VPC" {
  name        = "VPC"
  description = "VPC"
  parent_project_id = "a1fa2857-48f1-496a-8639-a2dcc36688ae"
}

resource "env0_project" "EC2" {
  name        = "EC2"
  description = "EC2"
  parent_project_id = "a1fa2857-48f1-496a-8639-a2dcc36688ae"
}

resource "env0_project" "RnD" {
  name        = "RnD"
  description = "RnD"
  parent_project_id = "a1fa2857-48f1-496a-8639-a2dcc36688ae"
}