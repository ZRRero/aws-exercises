resource "aws_dynamodb_table" "dynamodb_table" {
  provider = aws.master_region
  name = "ATable"
  hash_key = "aPartitionKey"
  attribute {
    name = "aPartitionKey"
    type = "S"
  }
  table_class = "STANDARD"
  billing_mode = "PAY_PER_REQUEST"
}