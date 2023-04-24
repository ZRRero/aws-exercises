## MemoryDB - Create a public MemoryDB database

### Solution

1. Go to MemoryDB dashboard and click on "Create a cluster" ![1](images/1.png)
2. Fill the name ![2](images/2.png)
3. Fill the name with the new subnet group name ![3](images/3.png)
4. Choose your VPC ![4](images/4.png)
5. Click on "Manage" in selected subnets ![5](images/5.png)
6. Add your public subnets and click on "Choose" ![6](images/6.png)
7. Set the node type ![7](images/7.png)
8. Select 2 as the number of shards ![8](images/8.png)
9. Click on "Next" ![9](images/9.png)
10. Click on "Manage" in security groups ![10](images/10.png)
11. Select your security groups and click on "Choose" ![11](images/11.png)
12. Click on "Create ACL" ![12](images/12.png)
13. Fill the name field ![13](images/13.png)
14. Click on "Create user" ![14](images/14.png)
15. The user name is "root" ![15](images/15.png)
16. Use any password compliant with the policy ![16](images/16.png)
17. Give full permissions on Access string ![17](images/17.png)
18. Click on "Create" ![18](images/18.png)
19. Go back to your ACL creation wizard and click on "Manage" ![19](images/19.png)
20. Choose the root user ![20](images/20.png)
21. Click on "Create" ![21](images/21.png)
22. Go back to your MemoryDB creation wizard and click on reload ACL ![22](images/22.png)
23. Select your created ACL ![23](images/23.png)
24. Leave rest as default and click on "Next" ![24](images/24.png)
25. Click on "Create" ![25](images/25.png)