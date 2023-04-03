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
  bucket = "myamazingdeveloperwebsite.com"
}

resource "aws_s3_bucket_policy" "storage_policy" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  policy = data.aws_iam_policy_document.storage_public_access.json
}

resource "aws_s3_object" "index_object" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error_object" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_public_access_block" "storage_access_block" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  provider = aws.master_region
  bucket   = aws_s3_bucket.storage.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}