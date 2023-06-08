resource "azurerm_resource_group" "rg" {
  name     = "${var.company}-${var.environment}-rg"
  location = var.location

  tags = {
    environment = var.environment
  }
}
