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

resource "aws_internet_gateway" "this" {

  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_eip" "nat" {

  for_each = aws_subnet.public

  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-${var.environment}-${replace(each.key, "public-subnet", "public-eip")}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_nat_gateway" "this" {

  for_each = aws_subnet.public

  allocation_id = aws_eip.nat[each.key].id

  subnet_id = each.value.id

  depends_on = [
    aws_internet_gateway.this
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-${replace(each.key, "public-subnet", "public-nat")}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table" "private" {

  for_each = aws_nat_gateway.this

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = each.value.id
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-${replace(each.key, "public-subnet", "private-rt")}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table_association" "public" {

  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_app" {

  for_each = aws_subnet.private_app

  subnet_id = each.value.id

  route_table_id = aws_route_table.private[
    replace(each.key, "private-app-subnet", "public-subnet")
  ].id
}

resource "aws_route_table_association" "private_db" {

  for_each = aws_subnet.private_db

  subnet_id = each.value.id

  route_table_id = aws_route_table.private[
    replace(each.key, "private-db-subnet", "public-subnet")
  ].id
}