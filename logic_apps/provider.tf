terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.87.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "48986b2e-5349-4fab-a6e8-d5f02072a4b8"
    tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
    skip_provider_registration = true
  features {}
}

provider "azurerm"{
  alias = "Hub"
  subscription_id = "3f8742cf-d078-4c0f-87c5-7c30b5e66509"
  skip_provider_registration = true
  tenant_id = "7571a489-bd29-4f38-b9a6-7c880f8cddf0"
  features {}
}