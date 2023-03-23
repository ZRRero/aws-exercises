data "aws_iam_policy_document" "lambda_policy" {
  statement {
    sid = "AllowSQS"
    effect = "Allow"
    actions = ["dynamodb:GetItem", "dynamodb:PutItem"]
    resources = [
      aws_dynamodb_table.dynamodb_table.arn
    ]
  }
}

data "aws_iam_policy_document" "lambda_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  provider = aws.master_region
  name = "lambda_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_policy.json
  inline_policy {
    name = "lambda_policy"
    policy = data.aws_iam_policy_document.lambda_policy.json
  }
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
}