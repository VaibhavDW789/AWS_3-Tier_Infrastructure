variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
}

variable "app_security_group_id" {
  description = "ID of the created Application EC2 Security Group"
  type        = string
}

variable "docker_image" {
  description = "Docker image to be used for the application"
  type        = string
}

variable "private_app_subnet_ids" {
  description = "List of IDs of the private application subnets"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling group"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling group"
  type        = number
  default     = 4
}

variable "database_endpoint" {
  description = "Endpoint of the database instance"
  type        = string
}

variable "database_secret_arn" {
  description = "ARN of the database secret in AWS Secrets Manager"
  type        = string
}