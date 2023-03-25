## VPC AWS - Create a VPC

### Solution

This solution is provided using AWS Console, Terraform and Pulumi, North Virginia (us-east-1) will be used

1. Enter to VPC and click on Create VPC button ![1](images/1.png)
2. Select VPC and more option ![2](images/2.png)
3. Fill the VPC name and change the CIDR block to 10.1.0.0/16 ![3](images/3.png)
4. Check the number of Availability Zones (AZ) to 3, then, mark 3 public subnets and 3 private subnets ![4](images/4.png)
5. Open the Customize CIDR blocks option and fill with the requested values ![5](images/5.png)
6. In NAT Gateways mark In 1 AZ and check None for VPC endpoints, then Create VPC ![6](images/6.png)