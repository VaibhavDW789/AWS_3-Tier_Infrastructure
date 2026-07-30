variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "ID of the created VPC"
  type        = string
}

variable "app_port" {
  description = "Port for the application"
  type        = number
  default     = 3000
}

variable "db_port" {
  description = "Port for the database"
  type        = number
  default     = 3306
}