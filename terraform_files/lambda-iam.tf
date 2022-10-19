#Create terraform iam policy
resource "aws_iam_role_policy" "lambda_iam_policy" {
  name = "lambda_iam_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid : "stmt1562499798378"
        Action   = "logs:*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

#Create terraform iam role
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
