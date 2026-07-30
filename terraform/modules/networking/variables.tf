variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  description = "Public presentation subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_app_subnets" {
  description = "Private application subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_db_subnets" {
  description = "Private database subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}