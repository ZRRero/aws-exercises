"""An AWS Python Pulumi program"""
import pulumi
from pulumi_aws import cloudfront
from pulumi_aws import s3
from pulumi_aws import iam

cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
distribution_id = "imagesDistribution"
origin_id = "imagesOrigin"

bucket = s3.BucketV2("images-store-1234567890")
index = s3.BucketObject("index.html", bucket=bucket.bucket, source=pulumi.FileAsset("astronauta.jpg"))
error = s3.BucketObject("error.html", bucket=bucket.bucket, source=pulumi.FileAsset("bailarina.jpg"))
origin_access_control = cloudfront.OriginAccessControl("images_origin", name=origin_id,
                                                       origin_access_control_origin_type="s3",
                                                       signing_behavior="always", signing_protocol="sigv4")
distribution = cloudfront.Distribution(distribution_id,
                                       default_cache_behavior=cloudfront.DistributionDefaultCacheBehaviorArgs(
                                           allowed_methods=["GET", "HEAD"], cached_methods=["GET", "HEAD"],
                                           target_origin_id=origin_id, viewer_protocol_policy="redirect-to-https",
                                           cache_policy_id=cache_policy_id), enabled=True, origins=[
        cloudfront.DistributionOriginArgs(domain_name=bucket.bucket_regional_domain_name, origin_id=origin_id,
                                          origin_access_control_id=origin_access_control.id)],
                                       price_class="PriceClass_100",
                                       restrictions=cloudfront.DistributionRestrictionsArgs(
                                           geo_restriction=cloudfront.DistributionRestrictionsGeoRestrictionArgs(
                                               restriction_type="none", locations=[])),
                                       viewer_certificate=cloudfront.DistributionViewerCertificateArgs(
                                           cloudfront_default_certificate=True))
policy_data = iam.get_policy_document_output(statements=[
    iam.GetPolicyDocumentStatementArgs(
        principals=[iam.GetPolicyDocumentStatementPrincipalArgs(
            type="Service",
            identifiers=["cloudfront.amazonaws.com"],
        )],
        actions=["s3:GetObject"],
        resources=[bucket.arn.apply(lambda v: f"{v}/*")],
        conditions=[iam.GetPolicyDocumentStatementConditionArgs(
            test="StringEquals",
            values=[distribution.arn.apply(lambda v:f"{v}")],
            variable="AWS:SourceArn"
        )]
    )
])
policy = s3.BucketPolicy("AllowPublicAccess", bucket=bucket.id, policy=policy_data.json)