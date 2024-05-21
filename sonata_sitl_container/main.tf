module "client_container_cluster" {
    source = "../modules/container_cluster"
    client = var.client
    location = var.location
    product = var.product 
}