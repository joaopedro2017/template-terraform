module "virtual_machine_linux" {
  source              = "../../azure/compute/virtual_machine_linux"
  for_each            = var.virtual_machine_linux["create"] ? toset(var.virtual_machine_linux["vm_names"]) : []
  prefix              = each.key
  resource_group_name = module.resource_group[0].name
  subnet_id           = module.subnet_virtual_machine_linux[0].id

  vm_size   = var.virtual_machine_linux["family_type"]
  publisher = var.virtual_machine_linux["publisher"]
  offer     = var.virtual_machine_linux["image_name"]
  sku       = var.virtual_machine_linux["image_version"]
  username  = var.virtual_machine_linux["username"]
  password  = var.virtual_machine_linux["password"]
  location  = var.location
}
