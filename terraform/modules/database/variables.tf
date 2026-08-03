variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "private_db_subnet_ids" {
  description = "IDs of the created private database subnets"
  type        = list(string)
}

variable "database_security_group_id" {
  description = "ID of the created database Security Group"
  type        = string
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
}