# Gathers configuration from parent terragrunt files.

include {
  path = find_in_parent_folders("global.hcl")
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id = "temporary-dummy-id"
    subnet_1 = "temporary-dummy-id"
  }
}