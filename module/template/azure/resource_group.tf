module "resource_group" {
  source      = "../../azure/management/resource_group"
  count       = local.create_resource_group
  project     = var.project
  environment = var.environment
  location    = var.location
}
