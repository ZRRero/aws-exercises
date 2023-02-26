## S3 AWS - Create a bucket with intelligent tiering and lifecycle policies

### Objectives

1. Create a bucket
   1. Bucket should have ACL disabled
   2. Bucket should have public access off
   3. Bucket should be versioned
2. Configure intelligent tiering
   1. These policies should only apply to objects with prefix "apply-policy/"
   2. 90 days to Archive Access
   3. 180 days to Deep Archive Access
3. Configure lifecycle policies
   1. These policies should only apply to objects with prefix "apply-policy/"
   2. After 30 days move objects to Standard IA
   3. After 60 days move objects to Intelligent Tiering