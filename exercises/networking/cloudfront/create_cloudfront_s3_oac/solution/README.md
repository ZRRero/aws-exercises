## Cloudfront - Create a Cloudfront distribution with OAC in S3 origin

### Solution

1. Go to S3 dashboard and click on "Create bucket" ![1](images/1.png)
2. Fill the name space with the name of the bucket, remember it must be unique ![2](images/2.png)
3. Click on "Create bucket" ![3](images/3.png)
4. Upload the images to the bucket ![4](images/4.png)
5. Go to CloudFront dashboard and click on "Create a CloudFront distribution" ![5](images/5.png)
6. Choose your bucket with images as the OriginDomain ![6](images/6.png)
7. Select Origin access control settings as the Origin access ![7](images/7.png)
8. Click on "Create control setting" ![8](images/8.png)
9. Leave default and click on "Create" ![9](images/9.png)
10. In viewer protocol policy select "Redirect HTTP to HTTPS" ![10](images/10.png)
11. On WAF click on "Do not enable security protections" ![11](images/11.png)
12. On price class select "Use only North America and Europe" ![12](images/12.png)
13. Leave others as default and click on "Create distribution" ![13](images/13.png)
14. Click on "Copy policy" ![14](images/14.png)
15. Go to your bucket and click on "Permissions" ![15](images/15.png)
16. Go to Bucket policy and click on "Edit" ![16](images/16.png)
17. Paste the policy copied and click on "Save changes" ![17](images/17.png)