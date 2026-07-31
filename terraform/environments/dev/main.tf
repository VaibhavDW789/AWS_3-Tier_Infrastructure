module "vpc" {
  source       = "../../modules/vpc"
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
}

module "networking" {
  source              = "../../modules/networking"
  project_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

module "security_group" {
  source       = "../../modules/security-group"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

module "load_balancer" {
  source                = "../../modules/load-balancer"
  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security_group.alb_security_group_id
}

module "autoscaling" {
  source                = "../../modules/autoscaling"
  project_name          = var.project_name
  environment           = var.environment
  instance_type         = var.instance_type
  key_name              = var.key_name
  app_security_group_id = module.security_group.app_security_group_id
  docker_image          = var.docker_image
}