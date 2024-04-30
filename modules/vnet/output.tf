output "vnet_resource_key" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_resource_key" {
  value = {for k, v in var.subnet_config: k => {
    name = azurerm_subnet.subnet[k].name
    id = azurerm_subnet.subnet[k].id}}
}