# output "resource_id" {
#   value = {"${azurerm_key_vault.keyvault.name}" = "${azurerm_key_vault.keyvault.id}"}
# }

output "kv_resource_key" {
  value = {for k, v in var.key_vault_config: k => {
    name = azurerm_key_vault.keyvault[k].name
    id = azurerm_key_vault.keyvault[k].id}}
}

output "resource_id" {
  value = { for k, v in var.key_vault_config : "${azurerm_key_vault.keyvault[k].name}" => "${azurerm_key_vault.keyvault[k].id}"}
}