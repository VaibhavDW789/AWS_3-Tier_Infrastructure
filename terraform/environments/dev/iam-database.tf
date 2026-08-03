resource "aws_iam_role_policy" "database_secret_access" {

  name = "${var.project_name}-${var.environment}-database-secret"

  role = module.iam.ec2_role_name

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "ReadDatabaseSecret"

        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue"
        ]

        Resource = module.database.master_user_secret_arn

      }

    ]

  })

}