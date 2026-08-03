variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_app_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_db_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "backup_retention_period" {
  description = "The number of days to retain backups for the database instance"
  type        = number
}