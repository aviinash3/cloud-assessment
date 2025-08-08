output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the crated EKS cluster."
}

output "cluster_version" {
  value       = module.eks.cluster_version
  description = "The version of Kubernetes running on the EKS cluster."
}