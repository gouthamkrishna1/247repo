location = "eastus"
product = "cca"
resource_group_name = "sitl-rg-prod-eus-cca"

key_vault_config = {
    # purge_protect = false
}

sku = "standard"
key_perm = "Get"
secret_perm = "Get"
storage_perm = "Get"

subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"

#Time to Live
ttl = 300

# subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
private_dns_rg = "sitl-rg-prod-eus-cca"

link_name = "dns_vnet_link"
private_dns_zone = "privatelink.vaultcore.azure.net"
vnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca"