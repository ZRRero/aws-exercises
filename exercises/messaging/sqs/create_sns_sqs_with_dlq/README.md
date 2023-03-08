## Messaging AWS - Create a SNS topic with a subscription to SQS and a DLQ

### Objectives

1. Create a SQS queue
   1. It should be a Standard queue
   2. Default visibility timeout of 60 seconds
   3. Message retention of 6 hours
   4. Maximum message size of 48 KB
   5. Long polling of 20 seconds
   6. No delivery delay
2. Create a SQS queue
   1. It should be a Standard queue
   2. It should be configured as the DLQ of the first queue
   3. Message retention period of 14 days
   4. Maximum receives of 3
3. Create a SNS Topic
   1. It should be a standard topic
   2. It should have a subscription pointing to the first queue