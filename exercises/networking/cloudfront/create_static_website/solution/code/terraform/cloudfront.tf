locals {
  origin_id = "websiteOrigin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  provider = aws.master_region
  origin {
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }
    domain_name = aws_s3_bucket_website_configuration.website.website_endpoint
    origin_id   = local.origin_id
  }
  enabled = true
  default_root_object = "index.html"
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