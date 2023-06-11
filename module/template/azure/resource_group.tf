module "resource_group" {
  source      = "../../azure/management/resource_group"
  count       = local.create_resource_group
  project     = var.az_authentication["project"]
  environment = var.az_authentication["environment"]
  location    = var.az_authentication["location"]
}
