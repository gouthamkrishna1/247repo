module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  product = var.product
  location = var.location
}

module "loganalytics" {
  source = "../modules/loganalytics"

  location = var.location
  product = var.product
  resource_group_name = module.rg.rg_name
  retention = var.retention
  sku = var.sku
}