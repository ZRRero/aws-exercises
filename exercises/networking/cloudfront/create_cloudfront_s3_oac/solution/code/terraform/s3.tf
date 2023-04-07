data "aws_iam_policy_document" "storage_cloudfront_access" {
  statement {
    principals {
      identifiers = ["cloudfront.amazonaws.com"]
      type = "Service"
    }
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.storage.arn}/*"]
    condition {
      test     = "StringEquals"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
      variable = "AWS:SourceArn"
    }
  }
}

resource "aws_s3_bucket" "storage" {
#  provider = aws.master_region
  bucket = "images-store-1234567890"
}

resource "aws_s3_bucket_policy" "storage_policy" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  policy = data.aws_iam_policy_document.storage_cloudfront_access.json
}

resource "aws_s3_object" "image_one" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "bailarina.jpg"
  source = "bailarina.jpg"
  content_type = "image/jpeg"
}

resource "aws_s3_object" "image_two" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "astronauta.jpg"
  source = "astronauta.jpg"
  content_type = "image/jpeg"
}