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
data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "ssna-${terraform.workspace}-backend-rg"
    storage_account_name = "ssnast${terraform.workspace}backend"
    container_name       = "tfstate"
    key                  = "${local.region}/rg/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "rg_name" {
  value = data.terraform_remote_state.rg.outputs.rg_name
  description = "resoucrce group name output for remotestate call"
}

output "rg_id" {
  value = data.terraform_remote_state.rg.outputs.rg_id
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}