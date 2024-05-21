module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  product = var.product
  location = var.location
}

# module "vnet" {
#   source = "../modules/tfs_azurerm_truth/network"
#   product = var.product
#   location = var.location
# }

module "log_analytics" {
  source = "../modules/tfs_azurerm_truth/loganalytics"

  product = var.product
  location = var.location
}

module "servicebus" {
  source = "../modules/tfs_azurerm_truth/service_bus"

  product = var.product
  location = var.location
  
}

module "diagonostics" {
  source = "../modules/diagonostic_setting"

  diagnostic_config = module.servicebus.servicebus_id

  log_id = module.log_analytics.loganalytics_id
  dest_type = var.dest_type
  category_group = var.category_group
  metrics = var.metrics

}