## Databases AWS - Create a provisioned DynamoDB table

### Solution

1. Enter the DynamoDB dashboard and click on create table ![1](images/1.png)
2. Enter the table name ![2](images/2.png)
3. Fill the partition key and sort key, select number for the sort key ![3](images/3.png)
4. Select customize settings, leave it as standard ![4](images/4.png)
5. Fill the values for average item size, read/second, write/second, read consistency and write consistency ![5](images/5.png)
6. Disable autoscaling, as there will be no changes in requirements, then provision the units with the calculator output ![6](images/6.png)
7. Leave encryption by default and click on create table ![7](images/7.png)