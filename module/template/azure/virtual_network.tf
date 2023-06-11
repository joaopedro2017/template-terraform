module "virtual_network" {
  source              = "../../azure/networking/virtual_network"
  count               = local.create_virtual_network
  resource_group_name = module.resource_group[0].name
  location            = var.location
  prefix              = "${var.az_authentication["project"]}-${var.az_authentication["environment"]}-vnet"
  address_space       = ["10.0.0.0/16"]
}
