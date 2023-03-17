resource "aws_sns_topic" "lambda_topic" {
  provider = aws.master_region
  name = "lambda_topic"
}

resource "aws_sns_topic_subscription" "lambda_topic_subscription" {
  provider = aws.master_region
  endpoint  = aws_lambda_function.lambda_function.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.lambda_topic.arn
}