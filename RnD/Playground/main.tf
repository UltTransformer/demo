data "env0_configuration_variable" "firewalls" {
  name       = "firewalls"
  project_id = data.env0_project.tenant_env0_project.id
}

locals {
  env0_tenant_project_variable = jsondecode(data.env0_configuration_variable.firewalls.value)
  test = [
    {
      description = "test"
      ports       = [15672, 80]
      services = [
        "AMQP",
        "AMQPS",
        "HTTPS",
        "STOMP",
        "STOMPS",
        "MQTT"
      ]
    }
  ]
}
