## Databases AWS - Create a provisioned DynamoDB table

### Objectives

1. Create a provisioned DynamoDB table
   1. The partition key is a string
   2. The sort key is a number
   3. Throughput should be the dominant cost
   4. It should be strongly consistent for read and standard for write
   5. The average item size is 4 KB
   6. It is expected that the application will read 10 items per second
   7. It is expected that the application will write 5 items per second
   8. There is no changes in the read/write requirements
   9. Encryption is managed by AWS