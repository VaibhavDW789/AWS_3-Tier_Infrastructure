output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = values(aws_subnet.public)[*].id
}

output "private_app_subnet_ids" {
  description = "IDs of the created private application subnets"
  value       = values(aws_subnet.private_app)[*].id
}

output "private_db_subnet_ids" {
  description = "IDs of the created private database subnets"
  value       = values(aws_subnet.private_db)[*].id
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_ids" {
  description = "IDs of the created NAT Gateways"
  value = {
    for k, nat in aws_nat_gateway.this :
    k => nat.id
  }
}

output "nat_gateway_public_ips" {
  description = "Public IPs of the created NAT Gateways"
  value = {
    for k, eip in aws_eip.nat :
    k => eip.public_ip
  }
}