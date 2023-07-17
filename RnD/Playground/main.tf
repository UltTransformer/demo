terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }
  }
}

data "env0_configuration_variable" "firewalls" {
  name       = "firewalls"
  project_id = data.env0_project.tenant_env0_project.id
}

env0_tenant_project_variable = jsondecode(data.env0_configuration_variable.firewalls.value)
### Pull data 
data "env0_configuration_variable" "firewalls" {
  name       = "firewalls"
  project_id = data.env0_project.tenant_env0_project.id
}

locals {
  # Convert the data to json
  env0_tenant_project_variable = jsondecode(data.env0_configuration_variable.firewalls.value)
  # Build attempt 
  test = [
    {
      description = "test"
      ports       = [15672, 80]
      services    = ["AMQP", "AMQPS", "HTTPS", "STOMP", "STOMPS", "MQTT"]
    }
  ]
}
