resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "name" {
  value = azurerm_virtual_network.vnet.name
}
