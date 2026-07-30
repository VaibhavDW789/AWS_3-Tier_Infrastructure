resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id = var.vpc_id

  cidr_block = each.value.cidr

  availability_zone = each.value.az

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.key}"
    Tier        = "Presentation"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "private_app" {

  for_each = var.private_app_subnets

  vpc_id = var.vpc_id

  cidr_block = each.value.cidr

  availability_zone = each.value.az

  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.key}"
    Tier        = "Application"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "private_db" {

  for_each = var.private_db_subnets

  vpc_id = var.vpc_id

  cidr_block = each.value.cidr

  availability_zone = each.value.az

  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.key}"
    Tier        = "Database"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}