resource "aws_sqs_queue" "lambda_queue" {
  provider = aws.master_region
  name = "lambda_queue"
}