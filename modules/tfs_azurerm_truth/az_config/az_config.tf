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
data "terraform_remote_state" "azconfig" {
  backend = "azurerm"
  config = {
    resource_group_name = "rg-${terraform.workspace}-backend"
    storage_account_name = "st${terraform.workspace}backend"
    container_name = "tfstate"
    key                  = "${local.region}/config/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "tenant_id" {
  value = data.terraform_remote_state.azconfig.outputs.tenant_id
  description = "tenant id output for remotestate call"
}

output "object_id" {
  value = data.terraform_remote_state.azconfig.outputs.object_id
  description = "object id output for remotestate call"
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}