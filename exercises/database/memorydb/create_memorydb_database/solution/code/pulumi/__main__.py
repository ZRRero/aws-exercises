"""An AWS Python Pulumi program"""
import pulumi
from pulumi_aws import memorydb
from pulumi_aws import ec2
import pulumi_random as random

vpcId = "id"
subnetsIds = ["subnetA", "subnetB"]
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
user = memorydb.User("root", access_string="on ~* &* +@all", user_name="root",
                     authentication_mode=memorydb.UserAuthenticationModeArgs(type="password",
                                                                             passwords=[password.result]))
acl = memorydb.Acl("acl", user_names=[user.user_name])
subnet_group = memorydb.SubnetGroup("subnet-group", subnet_ids=subnetsIds)
cluster = memorydb.Cluster("cluster", acl_name=acl.name, node_type="db.t4g.small", num_shards=2,
                           num_replicas_per_shard=1, subnet_group_name=subnet_group.name,
                           security_group_ids=[security_group.id])
