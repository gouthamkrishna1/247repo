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
data "terraform_remote_state" "function_app" {
  backend = "azurerm"
  config = {
    resource_group_name = "rg-${terraform.workspace}-backend"
    storage_account_name = "st${terraform.workspace}backend"
    container_name = "tfstate"
    key                  = "${local.region}/func/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "function_id" {
  value = data.terraform_remote_state.function_app.outputs.function_app_ids
  description = "resoucrce group name output for remotestate call"
}

output "storage_id" {
  value = data.terraform_remote_state.function_app.outputs.storage_account_key
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}