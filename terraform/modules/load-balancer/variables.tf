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

variable "public_subnet_ids" {
  description = "IDs of the created public subnets"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID of the created ALB Security Group"
  type        = string
}

variable "app_port" {
  description = "Port for the application"
  type        = number
  default     = 3000
}