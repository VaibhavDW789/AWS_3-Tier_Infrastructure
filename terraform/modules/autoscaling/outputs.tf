output "ubuntu_ami_id" {
  description = "Ubuntu AMI selected by the data source"
  value       = data.aws_ami.ubuntu.id
}

output "launch_template_id" {
  description = "ID of the created Launch Template"
  value       = aws_launch_template.app.id
}

output "launch_template_latest_version" {
  description = "Latest version of the created Launch Template"
  value       = aws_launch_template.app.latest_version
}

output "autoscaling_group_name" {
  description = "Name of the created Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}