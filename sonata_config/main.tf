module "config" {
  source = "../modules/config_container"

  location = var.location
  product = var.product
}