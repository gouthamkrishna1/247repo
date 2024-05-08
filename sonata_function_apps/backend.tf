locals {
  region = var.location == "westus" ? "westus" : "eastus"
  product = var.product == "cca"
}
 
terraform {
  backend "azurerm" {
    resource_group_name = "rg-${terraform.workspace}-backend"
    storage_account_name = "st${terraform.workspace}backend"
    container_name = "tfstate"
    key = "${local.region}/func/${terraform.workspace}/default.tfstate"
  }
}