output "db_endpoint" {
  description = "Endpoint of the database instance"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "Port of the database instance"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Name of the database instance"
  value       = aws_db_instance.this.db_name
}

output "master_user_secret_arn" {
  description = "Secrets Manager ARN created automatically by RDS"
  value       = aws_db_instance.this.master_user_secret[0].secret_arn
}