# Inputs for module.

inputs = {
  ec2-instance-name = "ec2-1-web"
  security-group-name = "ec2-1-web-sg"
}

# Gathers configuration from parent terragrunt files.

include {
  path = find_in_parent_folders("global.hcl")
}