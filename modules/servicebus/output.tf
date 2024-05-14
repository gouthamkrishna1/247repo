output "resource_id" {
  value = {"${azurerm_servicebus_namespace.servicebus_namespace.name}" = "${azurerm_servicebus_namespace.servicebus_namespace.id}"}
}

# output "resource_id" {
#   value = azurerm_servicebus_namespace.servicebus_namespace.id
# }

output "resource_name" {
  value = azurerm_servicebus_namespace.servicebus_namespace.name
}

output "id_servicebus" {
  value = azurerm_servicebus_namespace.servicebus_namespace.id
}