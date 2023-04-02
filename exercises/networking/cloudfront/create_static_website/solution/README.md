## Cloudfront - Create a static website in S3 and put it behind Cloudfront

### Solution

1. Go to S3 dashboard and click on "Create Bucket" ![1](images/1.png)
2. Configure the bucket name ![2](images/2.png)
3. In the Block Public Access settings uncheck all the marks and check the acknowledgement ![3](images/3.png)
4. Leave other options as default and click on "Create Bucket" ![4](images/4.png)
5. In the bucket objects upload the files for the website ![5](images/5.png)
6. Go to properties ![6](images/6.png)
7. Scroll down and click on "Edit" in the Static website hosting zone ![7](images/7.png)
8. Enable the feature ![8](images/8.png)
9. Specify names of your files and click on "Save changes" ![9](images/9.png)
10. Go to "Permissions" ![10](images/10.png)
11. There are two ways to provide public access, one is Bucket Policy and the other is using ACL, for this solution I'm using Bucket Policy as ACL are legacy, click on "Edit" in Bucket policy area ![11](images/11.png)
12. Add a policy that allows GetObject from any principal ![12](images/12.png)
13. Click on "Save changes" ![13](images/13.png)
14. Go to Cloudfront dashboard and click on "Create a CloudFront distribution" ![14](images/14.png)
15. In "Origin domain" select your bucket ![15](images/15.png)
16. It will advise you to use Website endpoint, select it ![16](images/16.png)
17. In viewer protocol policy select "Redirect HTTP to HTTPS" ![17](images/17.png)
18. In WAF options select "Do not enable security options" ![18](images/18.png)
19. Leaver everything as default and select "Create distribution" ![19](images/19.png)