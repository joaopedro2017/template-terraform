module "linux_virtual_machine_scale_set" {
  source              = "../../azure/compute/linux_virtual_machine_scale_set"
  count               = var.linux_virtual_machine_scale_set["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  subnet_id           = module.subnet_linux_virtual_machine_scale_set[0].id

  prefix           = var.linux_virtual_machine_scale_set["scale_set_name"]
  vm_size          = var.linux_virtual_machine_scale_set["family_type"]
  number_instances = var.linux_virtual_machine_scale_set["number_instances"]
  offer            = var.linux_virtual_machine_scale_set["image_name"]
  sku              = var.linux_virtual_machine_scale_set["image_version"]
  publisher        = var.linux_virtual_machine_scale_set["publisher"]
  username         = var.linux_virtual_machine_scale_set["username"]
  password         = var.linux_virtual_machine_scale_set["password"]
  location         = var.location
}
