resource "azurerm_resource_group" "deploy-rg" {
  name     = "ssna-rg-${var.product}-${terraform.workspace}-${var.location}"
  location = var.location
}