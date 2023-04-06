## Cloudfront - Create a static website in S3 and put it behind Cloudfront

### Objectives

1. Create a bucket with the following characteristics
    1. Has website hosting enabled
    2. Has index and error pages
    3. Public read access for everyone
2. Create a CloudFront distribution with the following characteristics
    1. Origin to the S3 static website
    2. It should redirect all HTTP to HTTPS
    3. Price class North America and Europe