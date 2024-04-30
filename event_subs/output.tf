output "default_function_key_url" {
  value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.default_function_key}"
  sensitive = true
}

output "primary_key_url" {
  value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.primary_key}"
  sensitive = true
}

output "event_grid_extension_config_key_url" {
  value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.event_grid_extension_config_key}"
  sensitive = true
}

# output "url" {
#   value = "https://${data.azurerm_linux_function_app.func_trigger.default_hostname}/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=${data.azurerm_function_app_host_keys.func_trigger.default_function_key}"
#   sensitive = true
# }

/*

default_function_key - Function App resource's default function key.

primary_key - Function App resource's secret key

event_grid_extension_config_key - Function App resource's Event Grid Extension Config system key.

signalr_extension_key - Function App resource's SignalR Extension system key.

durabletask_extension_key - Function App resource's Durable Task Extension system key.

webpubsub_extension_key - Function App resource's Web PubSub Extension system key.

blobs_extension_key - F

*/