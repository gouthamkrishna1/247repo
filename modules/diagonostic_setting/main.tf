resource "azurerm_monitor_diagnostic_setting" "diagnostic" {
  for_each =  var.diagnostic_config
  name = "ssl-${terraform.workspace}-diagnostic-settings"
  target_resource_id = each.key
  log_analytics_workspace_id = var.log_id
  log_analytics_destination_type = var.dest_type


  dynamic "enabled_log" {
    for_each = var.categories != [""] ?  var.categories : null
    content {
      category_group = var.category_group != "" ? var.category_group : null
      category       = length(enabled_log.value) > 0 ? enabled_log.value : null     #enabled_log.value != null ? enabled_log.value : null
    }
  }

  # enabled_log {
  #   category_group = var.category_group
  #   category = var.category
  # }

  metric {
    category = var.metrics
  }
}





# resource "azurerm_monitor_diagnostic_setting" "diagnostic" {
#   # for_each = local.association-map
#   name = "ssl-${terraform.workspace}-diagonostic-settings"
#   target_resource_id = var.target_resource_id
#   log_analytics_workspace_id = var.log_id 
#   log_analytics_destination_type = var.dest_type


#   dynamic "enabled_log" {
#     for_each = var.categories != [""] ?  var.categories : null
#     content {
#       category_group = var.category_group != "" ? var.category_group : null
#       category       = length(enabled_log.value) > 0 ? enabled_log.value : null     #enabled_log.value != null ? enabled_log.value : null
#     }
#   }

#   # enabled_log {
#   #   category_group = var.category_group
#   #   category = var.category
#   # }

#   metric {
#     category = var.metrics
#   }
# }


# locals {
#   association-map = merge([
#     for resource , resource_id in var.resource_key : {
#       "${resource}-diagnotics" => {
#         "resource_key" = resource_id
#       }
#     }
#   ]...)
# }