terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.87.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "67d37eda-76c7-4c34-8503-2df917769cfd"
    tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  features {}
}

# provider "azurerm"{
#   alias = "Hub"
#   subscription_id = "3f8742cf-d078-4c0f-87c5-7c30b5e66509"
#   tenant_id = "7571a489-bd29-4f38-b9a6-7c880f8cddf0"
#   skip_provider_registration = true
#   features {}
# }