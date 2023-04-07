"""An AWS Python Pulumi program"""
import pulumi
from pulumi_aws import cloudfront
from pulumi_aws import s3
from pulumi_aws import iam

cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
distribution_id = "websiteDistribution"
origin_id = "websiteOrigin"

bucket = s3.BucketV2("mydevelopersite.com")
policy_data = iam.get_policy_document_output(statements=[
    iam.GetPolicyDocumentStatementArgs(
        principals=[iam.GetPolicyDocumentStatementPrincipalArgs(
            type="*",
            identifiers=["*"],
        )],
        actions=["s3:GetObject"],
        resources=[bucket.arn.apply(lambda v: f"{v}/*")]
    )
])
public_access = s3.BucketPublicAccessBlock("PublicAccess", bucket=bucket.id)
policy = s3.BucketPolicy("AllowPublicAccess", bucket=bucket.id, policy=policy_data.json)
index = s3.BucketObject("index.html", bucket=bucket.bucket, source=pulumi.FileAsset("index.html"))
error = s3.BucketObject("error.html", bucket=bucket.bucket, source=pulumi.FileAsset("error.html"))
website = s3.BucketWebsiteConfigurationV2("website", bucket=bucket.id,
                                          index_document=s3.BucketWebsiteConfigurationV2IndexDocumentArgs(
                                              suffix=index.key),
                                          error_document=s3.BucketWebsiteConfigurationV2ErrorDocumentArgs(
                                              key=error.key))
distribution = cloudfront.Distribution(distribution_id,
                                       default_cache_behavior=cloudfront.DistributionDefaultCacheBehaviorArgs(
                                           allowed_methods=["GET", "HEAD"], cached_methods=["GET", "HEAD"],
                                           target_origin_id=origin_id, viewer_protocol_policy="redirect-to-https",
                                           cache_policy_id=cache_policy_id), enabled=True, origins=[
        cloudfront.DistributionOriginArgs(domain_name=bucket.website_endpoint, origin_id=origin_id,
                                          custom_origin_config=cloudfront.DistributionOriginCustomOriginConfigArgs(
                                              http_port=80, https_port=443, origin_protocol_policy="http-only",
                                              origin_ssl_protocols=["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]))],
                                       price_class="PriceClass_100",
                                       restrictions=cloudfront.DistributionRestrictionsArgs(
                                           geo_restriction=cloudfront.DistributionRestrictionsGeoRestrictionArgs(
                                               restriction_type="none", locations=[])),
                                       viewer_certificate=cloudfront.DistributionViewerCertificateArgs(
                                           cloudfront_default_certificate=True))
