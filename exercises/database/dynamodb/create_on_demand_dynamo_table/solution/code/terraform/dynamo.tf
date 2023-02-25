resource "aws_dynamodb_table" "dynamodb_table" {
  provider = aws.master_region
  name = "ATable"
  hash_key = "aPartitionKey"
  range_key = "aSortKey"
  attribute {
    name = "aPartitionKey"
    type = "S"
  }
  attribute {
    name = "aSortKey"
    type = "N"
  }
  table_class = "STANDARD_INFREQUENT_ACCESS"
  billing_mode = "PAY_PER_REQUEST"
}