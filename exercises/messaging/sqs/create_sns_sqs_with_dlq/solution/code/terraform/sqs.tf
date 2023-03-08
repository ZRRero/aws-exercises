resource "aws_sqs_queue" "original_queue" {
  provider = aws.master_region
  name = "original_queue"
  visibility_timeout_seconds = 60
  # 3600 (Seconds in an hour) * 6 hours
  message_retention_seconds = 21600
  # 48 KB * 1024 (KB expressed in bytes)
  max_message_size = 49152
  receive_wait_time_seconds = 20
}

resource "aws_sqs_queue" "original_dlq" {
  provider = aws.master_region
  name = "original_dlq"
  # 3600 (Seconds in an hour) * 24 hours in a day * 14 days
  message_retention_seconds = 1209600
  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue"
    sourceQueueArns = [aws_sqs_queue.original_queue.arn]
  })
}

resource "aws_sqs_queue_redrive_policy" "original_redrive" {
  provider = aws.master_region
  queue_url = aws_sqs_queue.original_queue.url
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.original_dlq.arn
    maxReceiveCount     = 3
  })
}

data "aws_iam_policy_document" "original_allow_sns_document" {
  statement {
    sid = "AllowRootManagement"
    effect = "Allow"
    principals {
      identifiers = ["sns.amazonaws.com"]
      type        = "Service"
    }
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.original_queue.arn]
    condition {
      test     = "ArnEquals"
      values   = [aws_sns_topic.original_topic.arn]
      variable = "aws:SourceArn"
    }
  }
}

resource "aws_sqs_queue_policy" "original_allow_sns" {
  provider = aws.master_region
  policy    = data.aws_iam_policy_document.original_allow_sns_document.json
  queue_url = aws_sqs_queue.original_queue.url
}