#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  region = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
  region_hub  = var.location == "eastus" ? "eus" : "wus"
  product     = var.product
}
 
#------------------------------------------
# Remote State file for Resource Group
#------------------------------------------
data "terraform_remote_state" "servicebus" {
  backend = "azurerm"
  config = {
    resource_group_name = "rg-${terraform.workspace}-backend"
    storage_account_name = "st${terraform.workspace}backend"
    container_name = "tfstate"
    key                  = "${local.region}/servicebus/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "servicebus_namespace" {
  value = data.terraform_remote_state.servicebus.outputs.servicebus_keys
  description = "servicebus namespace output for remotestate call"
}


variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}