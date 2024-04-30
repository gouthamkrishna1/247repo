
data "azurerm_storage_account" "storage_client" {
  resource_group_name = var.resource_group_name
  name = "ssnastccaprodeusclient"
}

data "azurerm_function_app_host_keys" "func_trigger" {
  resource_group_name = var.resource_group_name
  name = "ssna-func-cca-prod-eus-wftrigger"
}

data "azurerm_linux_function_app" "func_trigger" {
  resource_group_name = var.resource_group_name
  name = "ssna-func-cca-prod-eus-wftrigger"
}

locals {
  value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.default_function_key}"
  # sensitive = true  
}

# https://ssna-func-cca-prod-eus-wftrigger.azurewebsites.net/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=nSLDUiwlNrKsYVXmQqIYZ4j94qn1orAPzn7R8UfK3Vc6AzFu2gpv7Q==