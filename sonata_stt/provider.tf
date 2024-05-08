terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.87.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "80259ac9-0c1e-4bd4-b4e5-cd7f108e1d32"
    tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  features {}
}

provider "azurerm"{
  alias = "Hub"
  subscription_id = "1f4c125e-7f68-435c-9fd0-2cc2458c6175"
  tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  skip_provider_registration = true
  features {}
}