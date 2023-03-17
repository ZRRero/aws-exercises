## Computing AWS - Create a Lambda function with origin in SNS Topic and destination in SQS

### Solution

1. Enter SQS Dashboard and click "Create queue" ![1](images/1.png)
2. Fill the queue name and leave every thing else as default ![2](images/2.png)
3. Click "Create queue" ![3](images/3.png)
4. Go to SNS Dashboard and click on "Topics" ![4](images/4.png)
5. Click on "Create topic" ![5](images/5.png)
6. Select standard and fill the topic name, leave every thing else as default ![6](images/6.png)
7. Click on "Create topic" ![7](images/7.png)
8. Go to S3 dashboard and click on "Create bucket" ![8](images/8.png)
9. Fill the bucket name and leave every thing else as default ![9](images/9.png)
10. Click on "Create bucket" ![10](images/10.png)
11. Enter the created bucket and upload the code ![11](images/11.png)
12. Go to Lambda dashboard and click on "Create function" ![12](images/12.png)
13. Fill the function name and leave every thing else as default, in this case python 3.9 is selected for code ![13](images/13.png)
14. Click on "Create function" ![14](images/14.png)
15. Click on "Upload from" and select the "Amazon S3 location" option ![15](images/15.png)
16. Fill with the S3 URi of your function code ![16](images/16.png)
17. Click on "Add trigger" and fill with the SNS topic ![17](images/17.png)
18. Click on "Add destination" and fill "On success" and "Asynchronous invocation" with the SQS queue ![18](images/18.png)