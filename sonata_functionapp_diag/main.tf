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

module "function_app" {
  source = "../modules/tfs_azurerm_truth/function_app"

  product = var.product
  location = var.location
  
}

module "diagonostics" {
  source = "../modules/diagonostic_setting"

  target_resource_id = tostring(module.function_app.function_id)
  log_id = module.log_analytics.loganalytics_id
  dest_type = var.dest_type
  metrics = var.metrics
  categories = var.categories
}