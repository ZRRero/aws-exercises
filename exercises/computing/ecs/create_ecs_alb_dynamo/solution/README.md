## ECS - Create a ECS cluster and GRPC service with an ALB and DynamoDB connection

### Solution

Code for this solution is available [here](https://github.com/ZRRero/blacklist-api). The infrastructure will be developed using AWS management console, Terraform and Pulumi

1. Go to ECR dashboard and click on "Create repository"
2. Fill with the name of the repository
3. Click on "Create repository"
4. Enter the repository and click on "View push commands"
5. You will be shown 4 commands, apply them in your code where your Dockerfile is
6. First command will log you in Docker with ECR credentials
7. Second command will build your image and name it with the name of your repository
8. Third command will tag your image as "latest"
9. Last command will push your image to the ECR repository
10. Go to DynamoDB dashboard and click on "Create table"
11. Fill with the name of the service
12. For the given solution partition key is "record_id" and sort key is "sort_key"
13. Click on "Customize settings"
14. Click "On-demand" in Capacity mode
15. Click on "Create table"
16. Go to IAM dashboard roles section and click on "Create role"
17. On Use case select Elastic Container Service and then Elastic Container Service Task
18. Click on "Next"
19. Click on "Create policy"
20. For service select "DynamoDB"
21. The code requires the following permissions "GetItem", "BatchGetItem", "PutItem", "DeleteItem", "BatchWriteItem"
22. In resources use the created DynamoDB table to restrict access with ARN
23. Click on "Next: Tags"
24. Click on "Next: Review"
25. Give a descriptive name and click on "Create policy"
26. GO to your role creation tab and click on the refresh button
27. Search for your IAM policy and select it
28. Click on "Next"
29. Give the role a name
30. Click on "Create role"
31. Go to ECS dashboard and click on "Create cluster"
32. Fill with a name
33. Select a VPC and subnets
34. Leave as default and click on "Create"
35. Go to Task definitions and click on "Create task definition"
36. Fill the name
37. In the Image URI field of container paste your ECR image URI and give it a name
38. In Port mappings add your port with GRPC protocol
39. In environment variables add BLACKLIST_TABLE and the name of the DynamoDB table
40. Click on "Next"
41. On task size choose whatever you want, in this case .5 vCPU and 1 GB Memory will be used
42. On Task Role select the role you created
43. On Task Execution role select "Create new role"
44. Leave others by default and click on "Next"
45. Review your task definition and click on "Create"