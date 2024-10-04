terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}


module "nginx_instances" {
  source             = "./EC2"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = [module.subnets.private_subnet_a, module.subnets.private_subnet_b ]
  security_group_ids = [module.security_group.nginx_sg_id]
}

module "bastion" {
  source ="./bastion"
  public_subnet_id = module.subnets.public_subnet_a
  security_group_ids = [module.security_group.bastion_sg_id]
}

module "load_balancer" {
  source            = "./load_balancer"
  vpc_id    = module.vpc.vpc_id
  public_subnets    = [module.subnets.public_subnet_a, module.subnets.public_subnet_b]
  security_group_id = module.security_group.alb_sg_id
  instance_ids      = [module.nginx_instances.nginx_a_id, module.nginx_instances.nginx_b_id]
}