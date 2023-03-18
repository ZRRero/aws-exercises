## Computing AWS - Create a Lambda function with proxy API Gateway and DynamoDB database

### Objectives

1. Create a DynamoDB table with the following characteristics
    1. Storage should be the dominant cost
    2. Table should be on demand
    3. Encryption is managed by AWS
   4. Partition key is a string
   5. No sort key
2. Create a Lambda function with the following characteristics
    1. Code can be in any language
    2. Should have two versions and an Alias called "Current" pointing to latest version
    3. Receive two possible operations in path:
       1. First operation is POST /events/ which should store in Dynamo the body and an extra attribute pointing at the version
       2. Second operation is GET /events/{event_id} which should get from Dynamo the opbject, or a 404 if the item does not exist
    4. Code must be stored in S3
    5. Timeout of 1 second
3. Create a HTTP Api Gateway with the following characteristics
   1. Two stages, one called development, other called production
   2. For each stage a proxy route in /events/{+proxy} pointing to Lambda in a Lambda proxy integration
   3. No security