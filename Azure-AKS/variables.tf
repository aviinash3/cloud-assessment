variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure location"
  default     = "East US"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}

variable "node_count" {
  type        = number
  description = "Number of agent nodes"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "VM size for the agent pool"
  default     = "Standard_DS2_v2"
}

variable "acr_name" {
  type        = string
  default     = "exampleacr1234"
  description = "Name of the Azure Container Registry"
}

variable "acr_sku" {
  type        = string
  default     = "Standard"
  description = "SKU of the ACR"
}

variable "acr_admin_enabled" {
  type        = bool
  default     = true
}
variable "tags" {
  type        = map(string)
  default     = {
    environment = "test"
    project     = "acr-demo"
  }
}