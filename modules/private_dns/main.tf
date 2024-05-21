resource "azurerm_private_dns_zone" "dns" {
  for_each = var.private_config 
  name                = each.value.name
  resource_group_name = var.resource_group_name
}