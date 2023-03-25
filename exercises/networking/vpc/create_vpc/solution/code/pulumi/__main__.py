"""An AWS Python Pulumi program"""

import pulumi
from pulumi_aws import ec2

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_cidr_blocks = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]

# Create an AWS resource (VPC)
main = ec2.Vpc("main", cidr_block="10.1.0.0/16")
internet_gateway = ec2.InternetGateway("main_gateway", vpc_id=main.id)
elastic_ip = ec2.Eip("main_nat_ip", vpc=True)
public_route = ec2.RouteTableRouteArgs(cidr_block="0.0.0.0/0", gateway_id=internet_gateway.id)
subnet = None
for index in range(len(public_cidr_blocks)):
    subnet = ec2.Subnet("main_public_{}".format(index), cidr_block=public_cidr_blocks[index], vpc_id=main.id,
                        availability_zone=availability_zones[index])
    route_table = ec2.RouteTable("main_public_route_table_{}".format(index), vpc_id=main.id, routes=[public_route])
    route_table_association = ec2.RouteTableAssociation("main_public_route_table_association_{}".format(index),
                                                        subnet_id=subnet.id, route_table_id=route_table.id)

nat_gateway = ec2.NatGateway("main_nat_gateway", allocation_id=elastic_ip.allocation_id, subnet_id=subnet.id)
private_route = ec2.RouteTableRouteArgs(cidr_block="0.0.0.0/0", nat_gateway_id=nat_gateway.id)
for index in range(len(private_cidr_blocks)):
    subnet = ec2.Subnet("main_private_{}".format(index), cidr_block=private_cidr_blocks[index], vpc_id=main.id,
                        availability_zone=availability_zones[index])
    route_table = ec2.RouteTable("main_private_route_table_{}".format(index), vpc_id=main.id, routes=[private_route])
    route_table_association = ec2.RouteTableAssociation("main_private_route_table_association_{}".format(index),
                                                        subnet_id=subnet.id, route_table_id=route_table.id)
