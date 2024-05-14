location = "eastus"
product = "cca"

# subs_id = "3f8742cf-d078-4c0f-87c5-7c30b5e66509"
# resource_group_name = "sitl-rg-prod-eus-cca"

key_vault_config = {
    kv1={}
    # purge_protect = false
}

sku = "standard"
key_perm = "Get"
secret_perm = "Get"
storage_perm = "Get"

# subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"

#Time to Live
ttl = 300

# subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
private_dns_rg = "sit-prod-hub-rg"

link_name = "dns_vnet_link"
private_dns_zone = "privatelink.vaultcore.azure.net"
# vnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca"