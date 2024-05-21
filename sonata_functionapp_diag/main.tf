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

module "function_app" {
  source = "../modules/tfs_azurerm_truth/function_app"

  product = var.product
  location = var.location
  
}

module "diagonostics" {
  source = "../modules/diagonostic_setting"

  diagnostic_config = module.function_app.function_id
#   target_resource_id = module.function_app.function_id #["/subscriptions/3f8742cf-d078-4c0f-87c5-7c30b5e66509/resourceGroups/ssl-rg-cca-prd-eastus/providers/Microsoft.Web/sites/ssl-func-cca-prd-eus-transcode"].id
  log_id = module.log_analytics.loganalytics_id
  dest_type = var.dest_type
  metrics = var.metrics
  categories = var.categories
}