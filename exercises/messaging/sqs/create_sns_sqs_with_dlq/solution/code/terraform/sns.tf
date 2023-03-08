resource "aws_sns_topic" "original_topic" {
  provider = aws.master_region
  name = "original_topic"
}

resource "aws_sns_topic_subscription" "original_topic_queue_subscription" {
  provider = aws.master_region
  endpoint  = aws_sqs_queue.original_queue.arn
  protocol  = "sqs"
  topic_arn = aws_sns_topic.original_topic.arn
}