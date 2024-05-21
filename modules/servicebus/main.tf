resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  for_each = var.servicebusname_config
  name                = "ssl-sbns-${var.product}-${terraform.workspace}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = each.value.sku
  # premium_messaging_partitions = 1
  capacity = 1
  zone_redundant = false #applies to to true as westus doesnot support zone redundancy

  network_rule_set {
    trusted_services_allowed = each.value.trusted_services_allowed
    public_network_access_enabled = each.value.servicebus_public_network_access_enabled
  }
  
  tags = {
    Terraform_created = "yes"
  }

  public_network_access_enabled = var.servicebus_public_network_access_enabled
}

resource "azurerm_servicebus_topic" "servicebus_topic" {
  for_each = var.servicebustopic_config
  name         = "${var.product}-${terraform.workspace}-content"
  namespace_id = azurerm_servicebus_namespace.servicebus_namespace["servicebus"].id
  default_message_ttl = "P7D"
  auto_delete_on_idle = "P7D"
  requires_duplicate_detection = each.value.rddt
  duplicate_detection_history_time_window = "P1D"
  max_size_in_megabytes = "81920"

  enable_partitioning = true #recommended as true

  depends_on = [ azurerm_servicebus_namespace.servicebus_namespace ]
}

resource "azurerm_servicebus_subscription" "servicebus_subscription" {
  for_each = var.servicebussubs_config
  name               = "ssl-sbts-${var.product}-${terraform.workspace}-${var.location}"
  topic_id           = azurerm_servicebus_topic.servicebus_topic["servicebustopic"].id
  max_delivery_count = 100

  default_message_ttl = "P7D"

  auto_delete_on_idle = "P7D"
  dead_lettering_on_message_expiration = true
  dead_lettering_on_filter_evaluation_error = each.value.dlf
  # lock_duration = 1

  depends_on = [ azurerm_servicebus_namespace.servicebus_namespace, azurerm_servicebus_topic.servicebus_topic ]
  
}

resource "azurerm_role_assignment" "servicebus_role" {
  for_each = var.servicebus_role_config
    scope                = azurerm_servicebus_namespace.servicebus_namespace["servicebus"].id
    role_definition_name = var.role
    principal_id         =  var.pid
}