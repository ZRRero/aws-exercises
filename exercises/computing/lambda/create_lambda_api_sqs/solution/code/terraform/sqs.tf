resource "aws_sqs_queue" "original_queue" {
  provider = aws.master_region
  name = "original_queue"
}