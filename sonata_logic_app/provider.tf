terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    #   version = "3.37.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "b1ac7a5f-1633-402e-9bc3-ba2f537ce652"
    tenant_id = "02cc1320-a4bf-475a-8c52-8d52f8cef7c6"
  features {}
}

# provider "azurerm"{
#   alias = "Hub"
#   subscription_id = "34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e"
# #   tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
#   features {}
# }