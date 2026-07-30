output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "private_app_subnet_ids" {
  value = values(aws_subnet.private_app)[*].id
}