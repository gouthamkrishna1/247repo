resource "azurerm_virtual_network" "vnet" {
  name                = "ssna-vnet-${var.product}-${terraform.workspace}-${var.location}"
  address_space       = var.address_space
  location            = var.location
  resource_group_name =var.resource_group_name
}
 
resource "azurerm_subnet" "subnet" {
    for_each = var.subnet_config
  name                 = "ssna-snet-${each.key}-${var.product}-${terraform.workspace}-${var.location}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
 
  dynamic "delegation" {
    for_each = each.value.subnet_delegation ? each.value.subnet_delegation_iterate : {}
    iterator = subnet_delegation_iterate
    content {
      name = subnet_delegation_iterate.value.delegate_name

      service_delegation {
      name    = subnet_delegation_iterate.value.service_delegate #"Microsoft.Web/serverFarms"
      actions =  [subnet_delegation_iterate.value.action] #["Microsoft.Network/virtualNetworks/subnets/action"]
    }
    }
    
  }
}