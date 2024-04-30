#the product and location
location = "eastus"
product = "cca"
service = "logic"
resource_group_name = "shub-rg-prod-eus-cca"

#Application Insights Configuration

appinsights_config = {
    # appname = "tfslogicappinsights"
    apptype = "web"
}

#App Service Plan Configuration
appservice_config = {
    # app_service_name = "tfslogserviceplan"
    os_type = "Windows"
    sku_name = "WS1"
    zone_enable = false
    worker_count = "3"
    max_worker = "3"
}

#Storage Account Configuration

storage_acc_config ={ 
  "loggics" = {
    # storage_acc_name = "sitldevstg2202logic"
    account_tier = "Standard"
    account_replication_type = "LRS"
    public_network_access_enabled = true
    # pe_enable = true
    # networkrules_defaultaction = optional(string,"Deny")
    # ip_rules = ["103.203.73.130"]
    versioning_enabled = true
}}

#Logic App Configuration
logic_app_config = {
  logicapp = {

  }
}


# enable_sites_pep = true
# enable_blob_pep = true
# enable_file_pep = true
# enable_table_pep = true
# enable_queue_pep = true

#DNS Configuration/Time to Live
ttl = 300

private_dns_rg = "shub-rg-prod-eus-cca"


subnet_id = "/subscriptions/b1ac7a5f-1633-402e-9bc3-ba2f537ce652/resourceGroups/shub-rg-prod-eus-cca/providers/Microsoft.Network/virtualNetworks/shub-vnet-prod-eus-cca/subnets/paas"
outbound_subnet = "/subscriptions/b1ac7a5f-1633-402e-9bc3-ba2f537ce652/resourceGroups/shub-rg-prod-eus-cca/providers/Microsoft.Network/virtualNetworks/shub-vnet-prod-eus-cca/subnets/logicapp-outbound"
scope = "/subscriptions/b1ac7a5f-1633-402e-9bc3-ba2f537ce652/resourceGroups/shub-rg-prod-eus-cca"

# eventHub_connectionString = "Endpoint=sb://ssna-eventhubnamespace-cca-dev-eastus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=CKtGdg7n46AQYwsFEhmB96iNROm0UnWOL+AEhEBmpfA="

# Loganalytics
# log_name = "tfsloganalyticss"
# sku = "PerGB2018"
# retention = "30"

quota = "5000"

# link_name = "logicapp_link"
# private_dns_zone = "privatelink.azurewebsites.net"
# vnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus"
# workspace_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourcegroups/ssna-rg-cca-dev-eus/providers/microsoft.operationalinsights/workspaces/tfsloganalytics"

link_name = "dns_vnet_link"
private_dns_zone = "privatelink.azurewebsites.net"
private_dns_zone_storage = "privatelink.blob.core.windows.net"
private_dns_zone_storage_file = "privatelink.file.core.windows.net"
private_dns_zone_storage_queue = "privatelink.queue.core.windows.net"
private_dns_zone_storage_table = "privatelink.table.core.windows.net"
vnet_id = "/subscriptions/b1ac7a5f-1633-402e-9bc3-ba2f537ce652/resourceGroups/shub-rg-prod-eus-cca/providers/Microsoft.Network/virtualNetworks/shub-vnet-prod-eus-cca"