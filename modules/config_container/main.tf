locals {
   region = var.location == "eastus" ? "eus" : "wus"
   product = "cca"
}

resource "azurerm_storage_container" "container" {
  for_each = local.container_cluster_config
  name                  = "${each.value.container_name}" #"tfs-${var.product}-${terraform.workspace}-${var.client}-${each.key}"
  storage_account_name  =  "sslst${var.product}${terraform.workspace}${local.region}client"
#   metadata = each.value.metadata
}

locals {
    container_cluster_config = {
        # for client in var.var.client_list : {
        config-bucket={

            container_name = "tfs-${terraform.workspace}-${local.product}"
            # metadata = { 
            #     "ci_client" = "${var.client}" 
            # }
        }
    }
}