output "function_app_id" {
  value = {for k, v in var.func_app_config : "${azurerm_linux_function_app.function-app[k].name}" => "${azurerm_linux_function_app.function-app[k].id}"}
}

output "function_app_principal_id" {
  value = {for k, v in var.func_app_config : "${azurerm_linux_function_app.function-app[k].name}" => "${azurerm_linux_function_app.function-app[k].identity[0].principal_id}"}
}

output "func_id" {
  value = {for fa in azurerm_linux_function_app.function-app : fa.id => fa.name}
  # {for k,v in var.func_app_config : azurerm_linux_function_app.function-app[k].id => {
  #   id = azurerm_linux_function_app.function-app[k].id
  # }}
}
