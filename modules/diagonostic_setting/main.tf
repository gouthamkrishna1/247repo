resource "azurerm_monitor_diagnostic_setting" "diagonostic" {
  name               = "ssl-${terraform.workspace}-diagonostic_settings"
  target_resource_id = var.target_resource_id
  log_analytics_workspace_id = var.log_id 
  log_analytics_destination_type = var.dest_type

  enabled_log {
    category_group = var.category_group
  }

  metric {
    category = var.metrics
  }
}