## Computing AWS - Create a Lambda function with origin in API Gateway and destination in SQS

### Objectives

1. Create a Standard SQS queue with all values by default
2. Create a Lambda function with the following characteristics
   1. Code can be in any language
   2. Receive in the body of the event a json object with operand_one and operand_two values
   3. Sum both values
   4. Configure the SQS queue as destination
   5. Code must be stored in S3
   6. Timeout of 1 second
   7. 1 provisioned execution
3. Create an HTTP API Gateway with the following characteristics
   1. A route called POST /operations/sum that integrates with the lambda function
   2. The route should have IAM authorization
   3. The route should be in "development" stage