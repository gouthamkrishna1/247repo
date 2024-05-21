output "resource_id" {
  value = {for k, v in var.servicebusname_config : "${ azurerm_servicebus_namespace.servicebus_namespace[k].name}" => "${ azurerm_servicebus_namespace.servicebus_namespace[k].id}"}
}

# output "resource_id" {
#   value = azurerm_servicebus_namespace.servicebus_namespace.id
# }

output "servicebus_resource_key" {
  value = {for k, v in var.servicebusname_config: k => {
    name = azurerm_servicebus_namespace.servicebus_namespace[k].name
    id = azurerm_servicebus_namespace.servicebus_namespace[k].id}}
}

output "id_servicebus" {
  value = {for sb in azurerm_servicebus_namespace.servicebus_namespace : sb.id => sb.name}
}

# output "servicebus_principal_id" {
#   value = {for k, v in var.servicebusname_config: "${azurerm_servicebus_namespace.servicebus_namespace[k].name}" => "${azurerm_servicebus_namespace.servicebus_namespace[k].identity[0].principal_id}"}
# }