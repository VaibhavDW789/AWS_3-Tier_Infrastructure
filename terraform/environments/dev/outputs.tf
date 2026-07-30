output "vpc_id" {
  description = "Created VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Created public presentation subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "Created private application subnet IDs"
  value       = module.networking.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  description = "Created private database subnet IDs"
  value       = module.networking.private_db_subnet_ids
}

output "internet_gateway_id" {
  description = "Created Internet Gateway ID"
  value       = module.networking.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "Created NAT Gateway IDs"
  value       = module.networking.nat_gateway_ids
}

output "nat_gateway_public_ips" {
  description = "Public IPs of the created NAT Gateways"
  value       = module.networking.nat_gateway_public_ips
}

output "public_route_table_id" {
  description = "Created public route table ID"
  value       = module.networking.public_route_table_id
}

output "private_route_table_ids" {
  description = "Created private route table IDs"
  value       = module.networking.private_route_table_ids
}

output "alb_security_group_id" {
  description = "Created ALB Security Group ID"
  value       = module.security_group.alb_security_group_id
}

output "app_security_group_id" {
  description = "Created Application Security Group ID"
  value       = module.security_group.app_security_group_id
}

output "database_security_group_id" {
  description = "Created Database Security Group ID"
  value       = module.security_group.database_security_group_id
}