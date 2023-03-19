resource "aws_lambda_function" "lambda_function" {
  provider = aws.master_region
  function_name = "lambda_function_versioned"
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
  function_version = aws_lambda_function.lambda_function.version
  name = "current"
}

resource "aws_lambda_permission" "lambda_api_permission" {
  provider = aws.master_region
  statement_id = "AllowExecutionFromAPiGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_stage.lambda_production_stage.execution_arn}/ANY/events/{proxy+}"
  qualifier = aws_lambda_alias.lambda_alias.name
}