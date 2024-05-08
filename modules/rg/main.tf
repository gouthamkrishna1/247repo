resource "azurerm_resource_group" "deploy-rg" {
  name     = "ssl-rg-${var.product}-${terraform.workspace}-${var.location}"
  location = var.location
}