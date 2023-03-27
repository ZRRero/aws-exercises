"""An AWS Python Pulumi program"""

from pulumi_aws import dynamodb

table = dynamodb.Table("ATable",
                       attributes=[
                           dynamodb.TableAttributeArgs(
                               name="aPartitionKey",
                               type="S",
                           ),
                           dynamodb.TableAttributeArgs(
                               name="aSortKey",
                               type="N",
                           )
                       ],
                       billing_mode="PAY_PER_REQUEST",
                       table_class="STANDARD_INFREQUENT_ACCESS",
                       hash_key="aPartitionKey",
                       range_key="aSortKey"
                       )
