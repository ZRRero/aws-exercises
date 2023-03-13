resource "aws_s3_bucket" "storage" {
  provider = aws.master_region
  bucket = "da999251-storage-bucket"
}