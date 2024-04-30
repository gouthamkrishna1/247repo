module "rg" {
  source = "../modules/rg"

  location = var.location
  product = var.product
}