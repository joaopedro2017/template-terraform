module "network_interface" {
  source              = "../../networking/network_interface"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  prefix              = var.prefix
}

resource "azurerm_windows_virtual_machine" "windows" {
  name                  = "${var.prefix}-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [module.network_interface.id]
  size                  = var.vm_size
  admin_username        = var.username
  admin_password        = var.password

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
