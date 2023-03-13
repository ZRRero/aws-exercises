resource "aws_apigatewayv2_api" "api_gateway" {
  provider = aws.master_region
  name          = "api_gateway"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "api_gateway_v1_stage" {
  provider = aws.master_region
  api_id = aws_apigatewayv2_api.api_gateway.id
  name   = "api_gateway_v1_stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "api_gateway_lambda_integration" {
  api_id           = aws_apigatewayv2_api.api_gateway.id
  integration_type = "AWS_PROXY"
  connection_type = "INTERNET"
  integration_method = "POST"
  integration_uri = aws_lambda_function.lambda_function.arn
  passthrough_behavior = "WHEN_NO_MATCH"
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "lambda_api_permission" {
  provider = aws.master_region
  statement_id = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.account_id}:${aws_apigatewayv2_api.api_gateway.id}/${aws_apigatewayv2_stage.api_gateway_v1_stage.id}/POST/operations/sum"
}