output "ec2_role_name" {
  description = "EC2 IAM Role Name"
  value       = aws_iam_role.ec2.name
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.ec2.name
}

output "instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.ec2.arn
}