module "resource_group" {
  source      = "../../azure/management/resource_group"
  count       = local.create_resource_group
  company     = var.company
  environment = var.environment
  location    = var.location
}
