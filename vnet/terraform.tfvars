location  = "eastus"
product = "cca"

address_space = [ "10.0.0.0/16" ]

subnet_config = {
  "web" = {
    address_prefixes = ["10.0.1.0/24"]
  },

  "app" = {
    address_prefixes = ["10.0.2.0/24"]
  },

  "db" = {
    address_prefixes = ["10.0.3.0/24"]
  },

  "paas" = {
    address_prefixes = ["10.0.4.0/24"]
  },

  "func_outbound" = {
    address_prefixes = ["10.0.5.0/24"]
    subnet_delegation = true
    subnet_delegation_iterate = {
        set1 = {
            delegate_name = "func_delegation"
            service_delegate = "Microsoft.Web/serverFarms"
            action = "Microsoft.Network/virtualNetworks/subnets/action"
        }
    }
  },

  "logic_outbound" = {
    address_prefixes = ["10.0.6.0/24"]
    subnet_delegation = true
    subnet_delegation_iterate = {
        set2 = {
            delegate_name = "logic_delegation"
            service_delegate = "Microsoft.Web/serverFarms"
            action = "Microsoft.Network/virtualNetworks/subnets/action"
        }
    }
  }

}