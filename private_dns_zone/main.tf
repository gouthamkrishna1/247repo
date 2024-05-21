module "rg" {
  source = "../modules/tfs_azurerm_truth/rg"

  location = var.location
  product = var.product
}

module "private_dns" {
  source = "../modules/private_dns"
  private_config = var.private_config
  resource_group_name = module.rg.rg_name
}