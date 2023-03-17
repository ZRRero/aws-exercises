## Computing AWS - Create a Lambda function with origin in SNS Topic and destination in SQS

### Objectives

1. Create a Standard SQS queue with all values by default
2. Create a Lambda function with the following characteristics
   1. Code can be in any language
   2. Receive in the body of the event a json object with operand_one and operand_two values
   3. Sum both values
   4. Configure the SQS queue as destination
   5. Code must be stored in S3
   6. Timeout of 1 second
3. Create a Standard SNS topic with all values by default
   1. Configure the topic as origin for the lambda function