module "subnet_virtual_machine_windows" {
  source               = "../../azure/networking/subnet"
  count                = var.virtual_machine_windows["create"] ? 1 : 0
  resource_group_name  = module.resource_group[0].name
  virtual_network_name = var.virtual_machine_windows["create"] ? module.virtual_network[0].name : null
  prefix               = "${var.project}-${var.environment}-vm-windows"
  address_prefixes     = ["10.0.0.0/24"]
}

module "subnet_virtual_machine_linux" {
  source               = "../../azure/networking/subnet"
  count                = var.virtual_machine_linux["create"] ? 1 : 0
  resource_group_name  = module.resource_group[0].name
  virtual_network_name = var.virtual_machine_linux["create"] ? module.virtual_network[0].name : null
  prefix               = "${var.project}-${var.environment}-vm-linux"
  address_prefixes     = ["10.0.1.0/24"]
}

module "subnet_windows_virtual_machine_scale_set" {
  source               = "../../azure/networking/subnet"
  count                = var.windows_virtual_machine_scale_set["create"] ? 1 : 0
  resource_group_name  = module.resource_group[0].name
  virtual_network_name = var.windows_virtual_machine_scale_set["create"] ? module.virtual_network[0].name : null
  prefix               = "${var.project}-${var.environment}-vmss-windows"
  address_prefixes     = ["10.0.2.0/24"]
}

module "subnet_linux_virtual_machine_scale_set" {
  source               = "../../azure/networking/subnet"
  count                = var.linux_virtual_machine_scale_set["create"] ? 1 : 0
  resource_group_name  = module.resource_group[0].name
  virtual_network_name = var.linux_virtual_machine_scale_set["create"] ? module.virtual_network[0].name : null
  prefix               = "${var.project}-${var.environment}-vmss-linux"
  address_prefixes     = ["10.0.3.0/24"]
}
