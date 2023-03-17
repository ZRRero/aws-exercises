resource "aws_s3_bucket" "storage" {
  provider = aws.master_region
  bucket = "da999251-storage-bucket"
}

resource "aws_s3_object" "lambda_code" {
  provider = aws.master_region
  bucket = aws_s3_bucket.storage.bucket
  key = "configuration/lambda_function.zip"
  source = "LambdaCode.zip"
}