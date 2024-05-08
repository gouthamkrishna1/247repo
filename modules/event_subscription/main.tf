resource "azurerm_eventgrid_system_topic" "event_topic" {
  name                = "ssl-storage-${terraform.workspace}-${var.event_topic}"
  resource_group_name = var.resource_group_name
  location            = var.location
  source_arm_resource_id = var.source_id
  topic_type = var.topic_type ##"Microsoft.Storage.StorageAccounts"

}
 
resource "azurerm_eventgrid_event_subscription" "event_subs" {
  name                  = "ssl-storage-${terraform.workspace}-${var.event_subs}"
  scope                 = var.scope_id
  event_delivery_schema = var.event_schema
 
  included_event_types = [
    var.event_types
  ]
 
 azure_function_endpoint {
   function_id = var.function_id #"/subscriptions/80259ac9-0c1e-4bd4-b4e5-cd7f108e1d32/resourceGroups/ssl-rg-cca-stg-westus/providers/Microsoft.Web/sites/ssl-func-cca-stg-wus-wftrigger/functions/EventGridTrigger"
 }
  # webhook_endpoint {
  #  # url                  = "https.//${azurerm_linux_function_app.example.default_hostname}.azurewebsites.net"
  #   url                  = var.webhook_url
  #   }
}