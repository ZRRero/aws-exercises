"""An AWS Python Pulumi program"""
import pulumi
from pulumi_aws import memorydb
from pulumi_aws import ec2
import pulumi_random as random

vpcId = "id"
subnetsIds = []
security_group = ec2.SecurityGroup("security-group", vpc_id=vpcId, ingress=[ec2.SecurityGroupIngressArgs(
    description="Public Redis security group",
    from_port=6379,
    to_port=6379,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"]
)], egress=[ec2.SecurityGroupEgressArgs(
    from_port=0,
    to_port=0,
    protocol="-1",
    cidr_blocks=["0.0.0.0/0"],
)])
password = random.RandomPassword("password", length=16)
