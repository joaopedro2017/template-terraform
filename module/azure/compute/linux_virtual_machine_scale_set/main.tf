resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                            = "${var.prefix}-vmss"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.vm_size
  instances                       = var.number_instances
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
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${var.prefix}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}
