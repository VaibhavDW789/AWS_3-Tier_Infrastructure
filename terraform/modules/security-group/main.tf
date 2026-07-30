resource "aws_security_group" "alb" {
  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = "Application Load Balancer Security Group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port = 80
    to_port   = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port = 443
    to_port   = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}

resource "aws_security_group" "app" {
  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Application EC2 Security Group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow application traffic"
    from_port = var.app_port
    to_port   = var.app_port
    protocol = "tcp"
    security_groups = [
      aws_security_group.alb.id
    ]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-app-sg"
  }
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Database Security Group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow database traffic"
    from_port = var.db_port
    to_port   = var.db_port
    protocol = "tcp"
    security_groups = [
      aws_security_group.app.id
    ]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-db-sg"
  }
}