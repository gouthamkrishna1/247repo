terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    #   version = "3.37.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "48986b2e-5349-4fab-a6e8-d5f02072a4b8"

  features {
    # key_vault {
    #   purge_soft_delete_on_destroy    = true
    #   recover_soft_deleted_key_vaults = true
    # }
  }
}