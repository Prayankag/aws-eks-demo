variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "my_ecs_cluster"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "desired_task_count" {
  description = "Number of desired ECS tasks"
  type        = number
  default     = 1
}
