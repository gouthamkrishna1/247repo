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
data "terraform_remote_state" "loganalytics" {
  backend = "azurerm"
  config = {
    resource_group_name  = "ssna-${terraform.workspace}-backend-rg"
    storage_account_name = "ssnast${terraform.workspace}backend"
    container_name       = "tfstate"
    key                  = "${local.region}/loganalytics/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
    # key = "eastus/rg/default/default.tfstate"
 
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
output "loganalytics_id" {
  value = data.terraform_remote_state.loganalytics.outputs.loganalytics_id
  description = "loganalytics id output for remotestate call"
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}