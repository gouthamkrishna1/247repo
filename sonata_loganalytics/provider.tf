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