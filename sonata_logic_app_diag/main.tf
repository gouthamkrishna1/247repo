module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  product = var.product
  location = var.location
}

module "vnet" {
  source = "../modules/tfs_azurerm_truth/network"
  product = var.product
  location = var.location
}

module "log_analytics" {
  source = "../modules/tfs_azurerm_truth/loganalytics"

  product = var.product
  location = var.location
}

module "logic_app" {
  source = "../modules/tfs_azurerm_truth/logic_App"

  product = var.product
  location = var.location
}

module "diagonostics" {
  source = "../modules/diagonostic_setting"

  # target_resource_id = module.logic_app.logic_id.logicapp.id
  diagnostic_config = module.logic_app.logic_id
  log_id = module.log_analytics.loganalytics_id
  dest_type = var.dest_type
  metrics = var.metrics
  categories = var.categories
}