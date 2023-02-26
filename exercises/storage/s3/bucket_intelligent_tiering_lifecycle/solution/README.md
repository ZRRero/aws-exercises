## S3 AWS - Create a bucket with intelligent tiering and lifecycle policies

### Solution

This solution is provided using AWS Console and Terraform, North Virginia (us-east-1) will be used

1. Enter S3 dashboard and click on create bucket ![1](images/1.png)
2. Fill the name and set ACLs disabled ![2](images/2.png)
3. Leave block all public access enabled ![3](images/3.png)
4. Enable versioning ![4](images/4.png)
5. Click on create bucket ![5](images/5.png)
6. Enter the created bucket and click on properties ![6](images/6.png)
7. Scroll down until you find Intelligent-Tiering Archive configurations and click on Create Configuration ![7](images/7.png)
8. Fill the prefix with "apply-policy/" ![8](images/8.png)
9. Activate the Archive Access Tier option and set the value to 90 ![9](images/9.png)
10. Activate the Deep Archive Access Tier option and set the value to 180 ![10](images/10.png)
11. Click on create ![11](images/11.png)
12. Return to the bucket and go to management ![12](images/12.png)
13. Click on create lifecycle rule, fill the prefix with "apply-policy/" ![13](images/13.png)
14. In lifecycle rule actions select "Move current versions of objects between storage classes" ![14](images/14.png)
15. For Standard-IA fill with 30 ![15](images/15.png)
16. Click on Add Transition and select Intelligent-Tiering, fill with 60 ![16](images/16.png)
17. Click on create rule ![17](images/17.png)