module "azure_container_registry" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}


module "aks" {
  source = "./modules/aks"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  aks_cluster_name           = var.aks_cluster_name
  dns_prefix                 = var.dns_prefix
  node_count                 = var.node_count
  vm_size                    = var.vm_size
}
