module "subnet_virtual_machine_windows" {
  source               = "../../azure/networking/subnet"
  count                = var.virtual_machine_windows["create"] ? 1 : 0
  resource_group_name  = module.resource_group[0].name
  virtual_network_name = var.virtual_machine_windows["create"] ? module.virtual_network[0].name : null
  prefix               = "${var.company}-${var.environment}-vm-windows"
}
