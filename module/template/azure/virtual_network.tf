module "virtual_network" {
  source              = "../../azure/networking/virtual_network"
  count               = local.create_virtual_network
  resource_group_name = module.resource_group[0].name
  location            = var.location
  prefix              = "${var.company}-${var.environment}-vnet"
}
