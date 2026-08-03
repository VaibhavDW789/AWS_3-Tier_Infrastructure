resource "aws_db_subnet_group" "this" {

  name = lower("${var.project_name}-${var.environment}-db-subnet-group")

  subnet_ids = var.private_db_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_instance" "this" {

  identifier = lower("${var.project_name}-${var.environment}-mysql")

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name = "appdb"

  username = "admin"

  manage_master_user_password = true

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.database_security_group_id
  ]

  publicly_accessible = false

  storage_encrypted = true

  backup_retention_period = var.backup_retention_period

  multi_az = false

  deletion_protection = false

  skip_final_snapshot = true

  apply_immediately = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}