module "virtual_machine_windows" {
  source              = "../../azure/compute/virtual_machine_windows"
  for_each            = var.virtual_machine_windows["create"] ? toset(var.virtual_machine_windows["vm_names"]) : []
  prefix              = each.key
  resource_group_name = module.resource_group[0].name
  subnet_id           = module.subnet_virtual_machine_windows[0].id

  vm_size   = var.virtual_machine_windows["family_type"]
  publisher = var.virtual_machine_windows["publisher"]
  offer     = var.virtual_machine_windows["image_name"]
  sku       = var.virtual_machine_windows["image_version"]
  username  = var.virtual_machine_windows["username"]
  password  = var.virtual_machine_windows["password"]
  location  = var.location
}
