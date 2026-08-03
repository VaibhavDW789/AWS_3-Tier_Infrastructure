resource "aws_launch_template" "app" {
  name_prefix            = "${var.project_name}-${var.environment}-"
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  update_default_version = true

  iam_instance_profile {
    name = var.instance_profile_name
  }

  vpc_security_group_ids = [
    var.app_security_group_id
  ]

  user_data = base64encode(templatefile(
    "${path.module}/user-data.sh",
    {
      docker_image = var.docker_image
    }
  ))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-${var.environment}-app"
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}