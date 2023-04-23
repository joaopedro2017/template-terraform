module "resource_group" {
  source      = "../../azure/resource_group"
  count       = local.create_resource_group
  company     = var.company
  environment = var.environment
  location    = var.location
}
