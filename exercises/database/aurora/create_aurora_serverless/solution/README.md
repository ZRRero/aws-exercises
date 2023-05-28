## Aurora - Create a Aurora cluster

### Solution

1. Enter to RDS dashboard and click on "Create database" ![1](images/1.png)
2. Select "Aurora (PostgreSQL Compatible)" ![2](images/2.png)
3. Select "Aurora PostgreSQL (Compatible with PostgrSQL 14.6)" ![3](images/3.png)
4. As this is a dev database select "Dev/Test" template ![4](images/4.png)
5. Click on "Auto generate password" ![5](images/5.png)
6. Click on "Serverless V2" ![6](images/6.png)
7. Set the ACUs to 0.5 and 4 in min/max ![7](images/7.png)
8. Select "Yes" for public access, be sure that your VPC has "DNS resolution" and "DNS hostnames" enabled ![8](images/8.png)
9. Click on "Create new" in security groups ![9](images/9.png)
10. Click on "Create database" ![10](images/10.png)