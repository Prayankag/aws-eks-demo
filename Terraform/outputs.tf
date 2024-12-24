output "ecs_cluster_name" {
  description = "The ECS cluster name"
  value       = module.ecs.cluster_name
}

output "ecs_service_arns" {
  description = "ARNs of the ECS services"
  value       = module.ecs.service_arns
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnets" {
  description = "List of subnets"
  value       = module.vpc.public_subnets
}

output "region" {
  description = "AWS region"
  value       = var.region
}
