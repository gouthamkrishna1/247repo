# data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
 
  for_each                   = var.key_vault_config
  name                        = "kv-${var.product}-${terraform.workspace}-${var.location}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   =  var.tenant_id #"f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = each.value.purge_protect
  public_network_access_enabled = each.value.public_access

  sku_name = var.sku

  access_policy {
    tenant_id = var.tenant_id #data.azurerm_client_config.current.tenant_id #"f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
    object_id =   var.object_id #data.azurerm_client_config.current.object_id # "9afb82b8-0b71-4ea5-bc4b-73fea72c00d7" 

    key_permissions = [
      var.key_perm
    ]

    secret_permissions = [
      var.secret_perm
    ]

    storage_permissions = [
      var.storage_perm
    ]
  }

  tags = {
    "terraform created" = "yes"
  }
}