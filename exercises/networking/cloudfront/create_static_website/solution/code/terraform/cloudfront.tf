locals {
  origin_id = "websiteOrigin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  provider = aws.master_region
  origin {
    domain_name = aws_s3_bucket_website_configuration.website.website_domain
    origin_id   = local.origin_id
  }
  enabled = true
  default_root_object = "index.html"
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
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