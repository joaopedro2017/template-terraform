module "windows_virtual_machine_scale_set" {
  source              = "../../azure/compute/windows_virtual_machine_scale_set"
  count               = var.windows_virtual_machine_scale_set["create"] ? 1 : 0
  location            = var.location
  resource_group_name = module.resource_group[0].name
  subnet_id           = module.subnet_windows_virtual_machine_scale_set[0].id
  vm_size             = var.windows_virtual_machine_scale_set["family_type"]
  number_instances    = var.windows_virtual_machine_scale_set["number_instances"]
  prefix              = var.windows_virtual_machine_scale_set["scale_set_name"]
  publisher           = var.windows_virtual_machine_scale_set["publisher"]
  offer               = var.windows_virtual_machine_scale_set["image_name"]
  sku                 = var.windows_virtual_machine_scale_set["image_version"]
  username            = var.windows_virtual_machine_scale_set["username"]
  password            = var.windows_virtual_machine_scale_set["password"]
}

module "linux_virtual_machine_scale_set" {
  source              = "../../azure/compute/linux_virtual_machine_scale_set"
  count               = var.linux_virtual_machine_scale_set["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  subnet_id           = module.subnet_linux_virtual_machine_scale_set[0].id
  prefix              = var.linux_virtual_machine_scale_set["scale_set_name"]
  vm_size             = var.linux_virtual_machine_scale_set["family_type"]
  number_instances    = var.linux_virtual_machine_scale_set["number_instances"]
  offer               = var.linux_virtual_machine_scale_set["image_name"]
  sku                 = var.linux_virtual_machine_scale_set["image_version"]
  publisher           = var.linux_virtual_machine_scale_set["publisher"]
  username            = var.linux_virtual_machine_scale_set["username"]
  password            = var.linux_virtual_machine_scale_set["password"]
  location            = var.az_authentication["location"]
}
