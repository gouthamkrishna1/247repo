locals {
  region = var.location == "eastus" ? "eastus" : "westus"
  product = var.product == "cca"
}
 
terraform {
  backend "azurerm" {
    resource_group_name = "rg-${terraform.workspace}-backend"
    storage_account_name = "st${terraform.workspace}backend"
    container_name = "tfstate"
    key = "${local.region}/config{terraform.workspace}/default.tfstate"
  }
}