resource "aws_apigatewayv2_api" "lambda_api" {
  provider = aws.master_region
  name          = "lambda_api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda_production_stage" {
  provider = aws.master_region
  api_id = aws_apigatewayv2_api.lambda_api.id
  name   = "lambda_production_stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_production_integration" {
  api_id           = aws_apigatewayv2_api.lambda_api.id
  integration_type = "AWS_PROXY"
  connection_type = "INTERNET"
  integration_method = "POST"
  integration_uri = aws_lambda_alias.lambda_alias.invoke_arn
  passthrough_behavior = "WHEN_NO_MATCH"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "lambda_production_route" {
  api_id    = aws_apigatewayv2_api.lambda_api.id
  route_key = "ANY /events/{proxy+}"
  target = "integrations/${aws_apigatewayv2_integration.lambda_production_integration.id}"
}