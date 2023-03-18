## Computing AWS - Create a ECS - EC2 application with a load balancer

### Objectives

1. Create a Load Balancer
2. Create a ECS cluster with the following characteristics
   1. Infrastructure should be managed by t3a.nano EC2 instances
3. Create a ECS service inside the cluster with the following characteristics
   1. It should use the ASG as capacity provider
   2. It should have target tracking autoscaling based on the number of requests per target metric of the created Load Balancer