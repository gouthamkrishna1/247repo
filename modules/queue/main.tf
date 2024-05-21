resource "azurerm_storage_queue" "redactqueue" {
  for_each = var.queue_config
  name                 = each.value.queue_name
  storage_account_name = var.storage_account_name
}