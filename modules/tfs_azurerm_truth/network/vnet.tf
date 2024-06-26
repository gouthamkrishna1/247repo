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
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "ssna-${terraform.workspace}-backend-rg"
    storage_account_name = "ssnast${terraform.workspace}backend"
    container_name       = "tfstate"
    key                  = "${local.region}/vnet/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "vnet_id" {
  value = data.terraform_remote_state.vnet.outputs.vnet_id
  description = "vnet id output for remotestate call"
}

output "subnet_id" {
  value = data.terraform_remote_state.vnet.outputs.subnet_id
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}