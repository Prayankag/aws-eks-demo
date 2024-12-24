terraform {
  backend "remote" {
    organization = "TeKanAid"

    workspaces {
      name = "backstage-ecs-aws"
    }
  }
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "4.0.0"

  cluster_name = var.cluster_name
  region       = var.region

  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.public_subnets

  ecs_services = [
    {
      name             = "example-service"
      task_definition  = "${var.cluster_name}-task"
      desired_count    = 1
      launch_type      = "FARGATE"
      deployment_min   = 100
      deployment_max   = 200
      health_check_grace_period = 60
    }
  ]
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}
