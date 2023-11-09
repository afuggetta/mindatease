resource "azurerm_app_service_plan" "default" {
  location            = azurerm_resource_group.default.location
  name                = var.app_service.name
  resource_group_name = azurerm_resource_group.default.name
  kind = "linux"
  sku {
    size = var.app_service.size
    tier = var.app_service.tier
  }
}