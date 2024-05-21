output "logic_ids" {
  value = { for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" => "${azurerm_logic_app_standard.logic_app[k].id}"}
}

output "logic_app_principal_id" {
  value = {for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" => "${azurerm_logic_app_standard.logic_app[k].identity[0].principal_id}"}
}

output "logic_name" {
  value = [ for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" ]
}

output "lapp_id" {
  value = {for la in azurerm_logic_app_standard.logic_app : la.id => la.name}
  # {for k,v in var.func_app_config : azurerm_linux_function_app.function-app[k].id => {
  #   id = azurerm_linux_function_app.function-app[k].id
  # }}
}
# output "logicapp_id" {
#   value = {for k,v in var.var.logic_app_config:"${azurerm_logic_app_standard.logic_app.id}"}
# }

output "logic_resource_key" {
  value = {for k, v in var.logic_app_config: k => {
    name = azurerm_logic_app_standard.logic_app[k].name
    id = azurerm_logic_app_standard.logic_app[k].id}}
}