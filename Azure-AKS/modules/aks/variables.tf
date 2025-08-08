variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Azure location"
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
  default     = 1
}
variable "vm_size" {
  type        = string
  description = "VM size for the agent pool"
  default     = "Standard_DS2_v2"
}

