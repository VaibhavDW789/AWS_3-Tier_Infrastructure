output "alb_security_group_id" {
  description = "ID of the created ALB Security Group"
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "ID of the created Application EC2 Security Group"
  value       = aws_security_group.app.id
}

output "database_security_group_id" {
  description = "ID of the created Database Security Group"
  value       = aws_security_group.database.id
}