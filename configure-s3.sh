#!./bin/bash

bucket="text.bucket"

echo $bucket

#Creating bucket text.corpus.bucket
aws s3 mb s3://$bucket

#Copying the local text corpus to the bucket
aws s3 cp processd_food_reviews.txt s3://$bucket/processd_food_reviews.txt
