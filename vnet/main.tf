module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  product = var.product
  location = var.location
}

module "vnet" {
  source = "../modules/vnet"

  product = var.product
  location = var.location
  resource_group_name = module.rg.rg_name
  subnet_config = var.subnet_config
  address_space = var.address_space
}