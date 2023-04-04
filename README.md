# Exercises for AWS Cloud

These exercises aim to improve your understanding of AWS Cloud using Hands on laboratories with their solution.

**Note:** Some of these exercises will cost you and can't be performed using the free tier/resources, I strongly recommend deleting all infrastructure you created after completing the laboratory, this way you will not incur in unexpected costs in your account.

**Note(2):** Try to solve these laboratories using AWS console and IaC (Terraform or Pulumi)

- [AWS](#aws)
  - [Exercises](#exercises)
    - [Security Identity and Compliance](#security-identity-and-compliance)
    - [Networking and Content delivery](#networking-and-content-delivery)
    - [Databases](#databases)
    - [Storage](#storage)
    - [Messaging](#messaging)
    - [Computing](#computing)

# AWS

## Exercises

### Security Identity and Compliance

| Name                         | Topic | Objective and Instructions                                     | Solution                                                      | Comments |
|------------------------------|-------|----------------------------------------------------------------|---------------------------------------------------------------|----------|
| Create an IAM User and Group | IAM   | [Exercise](exercises/identity/iam/create_user_group/README.md) | [Solution](exercises/identity/iam/create_user_group/solution) |          |

### Networking and Content delivery

| Name                                           | Topic          | Objective and Instructions                                                  | Solution                                                                   | Comments |
|------------------------------------------------|----------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------|----------|
| Create a VPC                                   | VPC            | [Exercise](exercises/networking/vpc/create_vpc/README.md)                   | [Solution](exercises/networking/vpc/create_vpc/solution)                   |          |
| Create a static website with S3 and Cloudfront | S3, Cloudfront | [Exercise](exercises/networking/cloudfront/create_static_website/README.md) | [Exercise](exercises/networking/cloudfront/create_static_website/solution) |          | 

### Databases

| Name                                | Topic    | Objective and Instructions                                                        | Solution                                                                         | Comments |
|-------------------------------------|----------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------|----------|
| Create a provisioned DynamoDB table | DynamoDB | [Exercise](exercises/database/dynamodb/create_provisioned_dynamo_table/README.md) | [Solution](exercises/database/dynamodb/create_provisioned_dynamo_table/solution) |          |
| Create a on demand DynamoDB table   | DynamoDB | [Exercise](exercises/database/dynamodb/create_on_demand_dynamo_table/README.md)   | [Solution](exercises/database/dynamodb/create_on_demand_dynamo_table/solution)   |          |

### Storage

| Name                                                                 | Topic | Objective and Instructions                                                      | Solution                                                                       | Comments |
|----------------------------------------------------------------------|-------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------|----------|
| Create a S3 bucket with intelligent tiering and lifecycle management | S3    | [Exercise](exercises/storage/s3/bucket_intelligent_tiering_lifecycle/README.md) | [Solution](exercises/storage/s3/bucket_intelligent_tiering_lifecycle/solution) |          |

### Messaging

| Name                                                             | Topic    | Objective and Instructions                                            | Solution                                                             | Comments |
|------------------------------------------------------------------|----------|-----------------------------------------------------------------------|----------------------------------------------------------------------|----------|
| Create a SNS topic with a subscription to a SQS queue with a DLQ | SQS, SNS | [Exercise](exercises/messaging/sqs/create_sns_sqs_with_dlq/README.md) | [Solution](exercises/messaging/sqs/create_sns_sqs_with_dlq/solution) |          |

### Computing

| Name                                                                  | Topic                         | Objective and Instructions                                                | Solution                                                                 | Comments |
|-----------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------|--------------------------------------------------------------------------|----------|
| Create a Lambda function with SNS Topic trigger and SQS Destination   | SNS, Lambda, SQS              | [Exercise](exercises/computing/lambda/create_lambda_sns_sqs/README.md)    | [Solution](exercises/computing/lambda/create_lambda_sns_sqs/solution)    |          |
| Create a Lambda function with proxy API Gateway and DynamoDB database | API Gateway, Lambda, DynamoDB | [Exercise](exercises/computing/lambda/create_lambda_api_dynamo/README.md) | [Solution](exercises/computing/lambda/create_lambda_api_dynamo/solution) |          |