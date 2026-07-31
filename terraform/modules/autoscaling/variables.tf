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

variable "app_security_group_id" {
  description = "ID of the created Application EC2 Security Group"
  type        = string
}

variable "docker_image" {
  description = "Docker image to be used for the application"
  type        = string
}