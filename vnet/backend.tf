locals {
  region = var.location == "eastus" ? "eastus" : "westus"
  product = var.product == "cca"
}
 
terraform {
  backend "azurerm" {
    resource_group_name = "ssna-${terraform.workspace}-backend-rg"
    storage_account_name = "ssnast${terraform.workspace}backend"
    container_name = "tfstate"
    key = "${local.region}/vnet/${terraform.workspace}/default.tfstate"
  }
}