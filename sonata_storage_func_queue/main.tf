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

# module "log_analytics" {
#   source = "../modules/tfs_azurerm_truth/loganalytics"

#   product = var.product
#   location = var.location
# }

module "function_app" {
  source = "../modules/tfs_azurerm_truth/function_app"

  product = var.product
  location = var.location
  
}


module "queue" {
  source = "../modules/queue"
  queue_config = var.queue_config
  storage_account_name =module.function_app.storage_id.func.name
  
}