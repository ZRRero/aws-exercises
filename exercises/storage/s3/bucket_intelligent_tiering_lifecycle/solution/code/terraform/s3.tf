resource "aws_s3_bucket" "storage" {
  provider = aws.master_region
  bucket = "da999251-storage-bucket"
}

resource "aws_s3_bucket_versioning" "storage_versioning" {
  bucket = aws_s3_bucket.storage.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "storage_public_access_block" {
  bucket = aws_s3_bucket.storage.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  rule {
    id     = "transition_storage"

    filter {
      prefix = "apply-policy/"
    }

    transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days = 60
      storage_class = "INTELLIGENT_TIERING"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket_intelligent_tiering" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  name = "bucket_intelligent_tiering"

  filter {
    prefix = "upload/"
  }

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 90
  }
}