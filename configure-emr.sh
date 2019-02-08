#!./bin/bash


aws emr create-cluster --applications Name=Spark --ec2-attributes '{"InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-ce133b84"}' --service-role EMR_DefaultRole --enable-debugging --release-label emr-5.19.0 --log-uri 's3n://text.bucket/' --name 'text.cluster' --instance-groups '[{"InstanceCount":2,"InstanceGroupType":"CORE","InstanceType":"m1.medium","Name":"Core Instance Group"},{"InstanceCount":1,"InstanceGroupType":"MASTER","InstanceType":"m1.medium","Name":"Master Instance Group"}]' --configurations '[{"Classification":"spark","Properties":{},"Configurations":[]}]' --scale-down-behavior TERMINATE_AT_TASK_COMPLETION --region us-east-1

# Upoad tfidf pyspark script to bucket
aws s3 cp tf-idf-spark.py s3://text.bucket
