module "keyvault" {
    source = "../modules/kv"

    location = var.location
    product = var.product
    resource_group_name = var.resource_group_name
    key_perm =  var.key_perm
    secret_perm = var.secret_perm
    storage_perm = var.storage_perm
    sku = var.sku
}

module "keyvault_private_end_point" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["vault"]
    is_manual_connection = false
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.keyvault.resource_id
    subnet_id = var.subnet_id
}

module "keyvault-a-record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  dns_a_record_config = module.keyvault_private_end_point.private_end_point_IP_address
  ttl = var.ttl
}

module "keyvault_dns_vnet_link" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}