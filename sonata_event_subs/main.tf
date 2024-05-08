module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  product = var.product
  location = var.location
}

module "storage_client" {
  source = "../modules/tfs_azurerm_truth/storage_client"
  product = var.product
  location = var.location
}


module "function_app" {
  source = "../modules/tfs_azurerm_truth/function_app"

  product = var.product
  location = var.location
}


module "storage_event_subscription" {
  source = "../modules/event_subscription"

  event_topic = var.event_topic
  resource_group_name = module.rg.rg_name
  location = var.location
  topic_type = var.topic_type
  source_id = data.azurerm_storage_account.storage_client.id
  scope_id = data.azurerm_storage_account.storage_client.id
  event_schema = var.event_schema
  event_types = var.event_types
  event_subs = var.event_subs
  function_id = "${module.function_app.function_id["ssl-func-cca-prd-eus-wftrigger"]}/functions/EventGridTrigger"
  webhook_url = local.value #"https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.default_function_key}"
}


data "azurerm_storage_account" "storage_client" {
  resource_group_name = module.rg.rg_name
  name = module.storage_client.storage_account_name.client["name"]
}

data "azurerm_function_app_host_keys" "func_trigger" {
  resource_group_name = module.rg.rg_name
  name = "ssl-func-cca-${terraform.workspace}-eus-wftrigger"
}

data "azurerm_linux_function_app" "func_trigger" {
  resource_group_name = module.rg.rg_name
  name = "ssl-func-cca-${terraform.workspace}-eus-wftrigger"
}

locals {
  value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.primary_key}"
  # sensitive = true  
}

# https://ssna-func-cca-prod-eus-wftrigger.azurewebsites.net/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=nSLDUiwlNrKsYVXmQqIYZ4j94qn1orAPzn7R8UfK3Vc6AzFu2gpv7Q==