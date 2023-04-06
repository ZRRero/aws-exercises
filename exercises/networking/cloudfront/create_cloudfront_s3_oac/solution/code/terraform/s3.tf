data "aws_iam_policy_document" "storage_public_access" {
  statement {
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    resources = ["${aws_s3_bucket.storage.arn}/*"]
  }
}

resource "aws_s3_bucket" "storage" {
#  provider = aws.master_region
  bucket = "images-store-1234567890"
}

resource "aws_s3_bucket_policy" "storage_policy" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  policy = data.aws_iam_policy_document.storage_public_access.json
}

resource "aws_s3_object" "image_one" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "image_two" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
}