## Messaging AWS - Create a SNS topic with a subscription to SQS and a DLQ

### Solution

1. Enter SQS dashboard and click on "Create Queue" ![1](images/1.png)
2. As this will be the DLQ the name will be "original_dlq" ![2](images/2.png)
3. Scroll down and enter the values given ![3](images/3.png)
   1. Message retention 14 days
   2. The rest remains as default
4. Leave the rest by default and click on "Create Queue" ![4](images/4.png)
5. Go back to SQS dashboard and click on "Create Queue" again ![5](images/5.png)
6. This will be the queue subscribed to the SNS, so the name will be "original" ![6](images/6.png)
7. Scroll down and enter the values given ![7](images/7.png)
   1. Default visibility timeout of 60 seconds
   2. Message retention of 6 hours
   3. Maximum message size of 48 KB
   4. Long polling of 20 seconds
   5. No delivery delay
8. In Dead letter queue configuration add the previously created queue and 3 receives ![8](images/8.png)
9. Click on "Create Queue" ![9](images/9.png)
10. Go to the dlq created and click on "Edit" ![10](images/10.png)
11. Scroll down to Redrive Allow Policy, enable and select the original queue as origin ![11](images/11.png)
12. Click on "Save" ![12](images/12.png)
13. Go to SNS Dashboard and click on "Topics" ![13](images/13.png)
14. Click on "Create Topic" ![14](images/14.png)
15. Set the type as "Standard" and the name ![15](images/15.png)
16. Leave everything as default and click on "Create topic" ![16](images/16.png)
17. Click on "Create subscription" ![17](images/17.png)
18. Select "Amazon SQS" as protocol and the "original" queue as endpoint ![18](images/18.png)
19. Click on "Create subscription" ![19](images/19.png)
20. Go to SQS and edit "original" queue, then go to access policy and add permissions to the SNS topic to send messages ![20](images/20.png)
21. Click on "Save" ![21](images/21.png)