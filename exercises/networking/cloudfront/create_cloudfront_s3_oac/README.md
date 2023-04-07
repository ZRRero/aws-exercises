## Cloudfront - Create a Cloudfront distribution with OAC in S3 origin

### Objectives

1. Create a bucket with the following characteristics
    1. Has two images
    2. Should only allow connections from the distribution
2. Create a CloudFront distribution with the following characteristics
    1. Origin to the S3 bucket
    2. It should redirect all HTTP to HTTPS
    3. Access control configured to the S3 bucket 
    4. Price class North America and Europe