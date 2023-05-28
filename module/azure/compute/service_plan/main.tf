resource "azurerm_service_plan" "plan" {
  name                = "${var.prefix}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
  worker_count        = var.worker_count
}

output "id" {
  value = azurerm_service_plan.plan.id
}

output "name" {
  value = azurerm_service_plan.plan.name
}
