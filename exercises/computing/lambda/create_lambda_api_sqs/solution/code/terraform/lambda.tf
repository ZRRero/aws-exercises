resource "aws_lambda_function" "lambda_function" {
  provider = aws.master_region
  function_name = "lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  s3_bucket = aws_s3_bucket.storage.bucket
  s3_key = "configuration/lambda_function.zip"
  timeout = 1
}

resource "aws_lambda_alias" "lambda_function_alias" {
  function_name    = aws_lambda_function.lambda_function.function_name
  function_version = "$LATEST"
  name             = "lambda_function_alias"
}

resource "aws_lambda_provisioned_concurrency_config" "lambda_provisioned_concurrency" {
  function_name                     = aws_lambda_alias.lambda_function_alias.function_name
  provisioned_concurrent_executions = 0
  qualifier                         = aws_lambda_alias.lambda_function_alias.name
}