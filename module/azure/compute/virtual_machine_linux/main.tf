module "network_interface" {
  source              = "../../networking/network_interface"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  prefix              = var.prefix
}

resource "azurerm_linux_virtual_machine" "linux" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  network_interface_ids           = [module.network_interface.id]
  size                            = var.vm_size
  admin_username                  = var.username
  admin_password                  = var.password
  disable_password_authentication = false

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
