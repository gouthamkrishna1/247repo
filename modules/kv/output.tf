output "resource_id" {
  value = {"${azurerm_key_vault.keyvault.name}" = "${azurerm_key_vault.keyvault.id}"}
}