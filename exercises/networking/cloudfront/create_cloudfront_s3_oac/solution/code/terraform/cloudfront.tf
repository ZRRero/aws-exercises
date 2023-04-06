locals {
  origin_id = "imagesOrigin"
}

resource "aws_cloudfront_origin_access_control" "images_origin" {
  provider = aws.master_region
  name                              = local.origin_id
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  provider = aws.master_region
  origin {

    domain_name = aws_s3_bucket.storage.bucket
    origin_id   = local.origin_id
  }
  enabled = true
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
    // Managed-CachingOptimized - Managed by AWS
    // See more at https://us-east-1.console.aws.amazon.com/cloudfront/v3/home#/policies/cache
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }
  price_class = "PriceClass_100"
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations = []
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}