from __future__ import print_function
from pyspark import SparkContext, SparkConf
from pyspark.mllib.feature import HashingTF, IDF
# import os
# os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages com.amazonaws:aws-java-sdk:1.10.34,org.apache.hadoop:hadoop-aws:2.6.0 pyspark-shell'


if __name__ == "__main__":
 
  sc = SparkContext(appName = 'text.cluster')
  

  food_reviews = sc.textFile('s3://text.bucket/processd_food_reviews.txt').map(lambda x: x.split(' '))

  hashingTF = HashingTF()
  
  tf = hashingTF.transform(food_reviews)
  tf.cache()
  idf = IDF().fit(tf)
  tfidf = idf.transform(tf)

  tfidf.saveAsTextFile('s3://text.bucket/tfidf_matrix')

  sc.stop()

