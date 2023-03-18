resource "aws_lambda_function" "lambda_function" {
  provider = aws.master_region
  function_name = "lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  publish = true
  s3_bucket = aws_s3_bucket.storage.bucket
  s3_key = "configuration/lambda_function.zip"
  timeout = 1
}

resource "aws_lambda_alias" "lambda_alias" {
  function_name = aws_lambda_function.lambda_function.function_name
  role          = aws_iam_role.lambda_role.arn
  function_version = "1"
  name = "current"
}

resource "aws_lambda_permission" "lambda_api_permission" {
  provider = aws.master_region
  statement_id = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sns.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.lambda_api.execution_arn}/*"
}