# Gathers configuration from parent terragrunt files.

include {
  path = find_in_parent_folders("global.hcl")
}

# Mock variables

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id = "temporary-dummy-id"
  }
  mock_outputs_allowed_terraform_commands = ["validate"]
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}