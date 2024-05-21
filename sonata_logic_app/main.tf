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

module "servicebus" {
  source = "../modules/tfs_azurerm_truth/service_bus"
  product = var.product
  location = var.location
}

module "storage_client" {
  source = "../modules/tfs_azurerm_truth/storage_client"
  product = var.product
  location = var.location
}

###########################################
#log analytics
###########################################


# module "loganalytics" {
#   source = "../modules/loganalytics"

#   location = var.location
#   product = var.product
#   resource_group_name = var.resource_group_name
#   log_name = var.log_name
#   retention = var.retention
#   sku = var.sku
# }

module "loganalytics_workspace" {
  source = "../modules/tfs_azurerm_truth/loganalytics"

  location = var.location
  product = var.product
}


###########################################
#appinsights
###########################################

module "app_insights" {
    source = "../modules/appinsights"

    appinsights_config = var.appinsights_config
    location = var.location
    resource_group_name = module.rg.rg_name
    service = var.service 
    workspace_id = module.loganalytics_workspace.loganalytics_id
    # workspace_id = module.loganalytics.log_id
    product = var.product

    depends_on = [ module.loganalytics_workspace ]
}

###########################################
#app service
###########################################

module "app_service" {
    source = "../modules/appservice"
    appservice_config = var.appservice_config
    location = var.location
    resource_group_name = module.rg.rg_name
    product = var.product
    service = var.service

}

###########################################
#logic app storage
###########################################

module "logic_app_storage" {
    source = "../modules/storage_account"
    storage_acc_config = var.storage_acc_config
    resource_group_name = module.rg.rg_name
    location = var.location
    product = var.product
}

# Fileshare creation
module "fileshare" {
  source = "../modules/fileshare"

  name = "${module.logic_app.logic_name[0]}-content"
  storage_name = module.logic_app_storage.storage_account_name[0]
  quota = var.quota

  depends_on = [ module.logic_app_storage ]
}

module "logic_app" {
    source = "../modules/logic_app"
    logic_app_config = var.logic_app_config
    location = var.location
    lg_app_service_id = module.app_service.app_service_id
    lg_primary_access_key = module.logic_app_storage.storageaccount_resource_properties["logic"].key
    lg_storage_account_name = module.logic_app_storage.storageaccount_resource_properties["logic"].name
    # storage_account_name = module.func_app_storage.storageaccount_resource_properties["func"].name
    # primary_access_key = module.func_app_storage.storageaccount_resource_properties["func"].key
    resource_group_name = module.rg.rg_name
    blobendpoint =module.storage_client.storage_account_name.client["name"]
    servicebus = module.servicebus.servicebus_namespace.servicebus["name"]
    product = var.product
    connection_string = module.app_insights.app_insights_instrument_key
    # eventHub_connectionString = var.eventHub_connectionString

    depends_on = [ module.logic_app_storage ]
}



module "logic_app_storage_pep" {
  source = "../modules/private_end_point"
    private_endpoint_config = ["blob","file","queue","table"]
    is_manual_connection = false
    resource_group_name = module.rg.rg_name
    location = var.location
    resource_key = module.logic_app_storage.storageaccount_resource_id
    subnet_id = module.vnet.subnet_id.paas.id
}

module "storage_dns_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.logic_app_storage_pep.private_end_point_IP_address
}


###########################################
#logic app
###########################################

module "logicapp_private_endpoint" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["sites"]
    is_manual_connection = false
    resource_group_name = module.rg.rg_name
    location = var.location
    resource_key = module.logic_app.logic_ids
    subnet_id = module.vnet.subnet_id.paas.id
}

module "logic_app_dns_a_record" {
  source = "../modules/dns_a_record"
  private_dns_rg = var.private_dns_rg
  ttl = var.ttl
  dns_a_record_config = module.logicapp_private_endpoint.private_end_point_IP_address
  
}

module "vnet-link" {
  source = "../modules/vnet_integration"

  vnet_integeration_config = module.logic_app.logic_ids
  outbound_subnet = module.vnet.subnet_id.logic_outbound.id #the subnet which is used for logicapp vnet linking

  # depends_on = [ module.logic_app ]
}


##############################
#IAM
##############################

module "IAM_logicapp" {
    source = "../modules/iam"
  resource_principal_id = module.logic_app.logic_app_principal_id
  scope = module.rg.rg_id
  role_definition_name = "Storage Blob Data Contributor"
}

module "IAM_servicebus" {
    source = "../modules/iam"
  resource_principal_id = module.logic_app.logic_app_principal_id
  scope = module.rg.rg_id
  role_definition_name = "Azure Service Bus Data Sender"
}
############################################
#DNS vnet linking
############################################

# module "dns_vnet_link_logic" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }

# module "dns_vnet_link_storage_blob" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone_storage
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }

# module "dns_vnet_link_file_storage" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone_storage_file
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }

# module "dns_vnet_link_queue_storage" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone_storage_queue
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }

# module "dns_vnet_link_table_storage" {
#   source = "../modules/vnet_linking"

#   link_name = var.link_name
#   private_dns_rg = var.private_dns_rg
#   private_dns_zone = var.private_dns_zone_storage_table
#   vnet_id = var.vnet_id
#   registration_enabled =var.registration_enabled

# }