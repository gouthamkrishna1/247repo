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

module "azconfig" {
  source = "../modules/tfs_azurerm_truth/az_config"
  product = var.product
  location = var.location
}

module "keyvaults" {
  source = "../modules/az_keyvault"
  product = var.product
  location = var.location

  resource_group_name = module.rg.rg_name
  key_perm = var.key_perm
  secret_perm = var.secret_perm
  storage_perm = var.storage_perm
  sku = var.sku
  tenant_id = module.azconfig.tenant_id
  object_id = module.azconfig.object_id
  key_vault_config = var.key_vault_config
}

# module "keyvault" {
#     source = "../modules/az_keyvault"

#     location = var.location
#     product = var.product
#     resource_group_name = module.rg.rg_name
#     key_perm =  var.key_perm
#     secret_perm = var.secret_perm
#     storage_perm = var.storage_perm
#     sku = var.sku
#     tenant_id = module.azconfig.tenant_id
#     object_id = module.azconfig.object_id
#     key_vault_config = var.key_vault_config
# }

module "keyvaults_private_end_point" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["vault"]
    is_manual_connection = false
    resource_group_name = module.rg.rg_name
    location = var.location
    resource_key = module.keyvaults.resource_id
    subnet_id = module.vnet.subnet_id.paas.id
}

module "keyvauls_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  dns_a_record_config = module.keyvaults_private_end_point.private_end_point_IP_address
  ttl = var.ttl
}

module "keyvaults_dns_vnet_link" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone
  vnet_id = module.vnet.vnet_id
  registration_enabled =var.registration_enabled

}