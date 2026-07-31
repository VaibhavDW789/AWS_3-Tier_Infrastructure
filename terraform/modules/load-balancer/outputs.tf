output "load_balancer_arn" {
  description = "ARN of the created ALB"
  value       = aws_lb.this.arn
}

output "load_balancer_dns_name" {
  description = "DNS name of the created ALB"
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "ARN of the created Target Group"
  value       = aws_lb_target_group.app.arn
}