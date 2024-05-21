location = "eastus"
product = "cca"

servicebusname_config = {
  "servicebus" = {
  }
}

servicebustopic_config = {
  "servicebustopic" = {
    
  }
}

servicebussubs_config = {
  "servicebussubs" = {
    
  }
}

servicebus_role_config = {
  "servicebusrole" = {
    
  }
}

role = "Azure Service Bus Data Receiver"
pid = "eaba851d-9963-499a-a24a-d535f178b4ea" #(can vary based on access given to the user)

# servicebus_public_network_access_enabled =false

#private endpoint configuration values

#Time to Live
ttl = 300
servicebus_public_network_access_enabled = "false"
# subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
private_dns_rg = "sit-prod-hub-rg"

link_name = "dns_vnet_link"
private_dns_zone = "privatelink.servicebus.windows.net"
# vnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca"