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