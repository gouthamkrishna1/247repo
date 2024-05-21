output "private_dns_zone_names" {
    value = {for k, v in var.private_config: k => {
        name = azurerm_private_dns_zone.dns[k].name
        id = azurerm_private_dns_zone.dns[k].id}}
}