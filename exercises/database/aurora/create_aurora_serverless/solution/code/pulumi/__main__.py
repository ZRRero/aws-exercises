"""An AWS Python Pulumi program"""
import pulumi
from pulumi_aws import rds
from pulumi_aws import ec2
import pulumi_random as random

vpcId = "id"
subnetsIds = ["subnetA", "subnetB", "SubnetC"]
security_group = ec2.SecurityGroup("security-group", vpc_id=vpcId, ingress=[ec2.SecurityGroupIngressArgs(
    description="Public Redis security group",
    from_port=5432,
    to_port=5432,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"]
)], egress=[ec2.SecurityGroupEgressArgs(
    from_port=0,
    to_port=0,
    protocol="-1",
    cidr_blocks=["0.0.0.0/0"],
)])
password = random.RandomPassword("password", length=16)
db_subnet_group_name = rds.SubnetGroup("subnet_group", subnet_ids=subnetsIds)
cluster = rds.Cluster("cluster", cluster_identifier="aurora-cluster", engine="aurora-postgresql",
                      engine_mode="provisioned", engine_version="14.6", master_username="root",
                      master_password=password.result, db_subnet_group_name=db_subnet_group_name.name,
                      vpc_security_group_ids=[security_group.id], database_name="some_database",
                      skip_final_snapshot=True,
                      serverlessv2_scaling_configuration=rds.ClusterServerlessv2ScalingConfigurationArgs(
                          min_capacity=0.5,
                          max_capacity=4
                      ))
