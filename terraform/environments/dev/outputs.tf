output "vpc_id" {
  description = "Created VPC ID"
  value       = module.vpc.vpc_id
}

output "load_balancer_dns_name" {
  description = "DNS name of the created ALB"
  value       = module.load_balancer.load_balancer_dns_name
}