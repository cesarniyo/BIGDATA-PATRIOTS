
import os
import time
from datetime import datetime
import json

from pyspark import SparkContext, SparkConf,SQLContext,Row
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
from pyspark.sql import SparkSession
from pyspark.sql import HiveContext
import pandas as pd



sc = SparkContext()
ssc = StreamingContext(sc, 5)

#Create Spark session with MongoDB supported.
appName = "PySpark MongoDB Example"
ss = SparkSession \
    .builder \
    .appName(appName) \
    .config("spark.mongodb.input.uri", "mongodb://sandbox-hdp.hortonworks.com:27017/test.coll") \
    .config("spark.mongodb.output.uri", "mongodb://sandbox-hdp.hortonworks.com:27017/test.coll") \
    .getOrCreate()
sqlc= SQLContext(sc)

    
kvs = KafkaUtils.createDirectStream(ssc, ['bigdata'], {'metadata.broker.list': 'sandbox-hdp.hortonworks.com:6667'})    
lines = kvs.map(lambda x: x[1])


def transformer(rdd):
    my_obj=json.loads(rdd)
    phasedict=my_obj['phase']
    siteslist=my_obj['sites']
    sitelistdict=siteslist[0]

    primary_purposedict=my_obj['primary_purpose']# this outputs a dict
    primary_purposedict['primary_purpose_code']# accessing the dict

    diseasesdictlist=my_obj['diseases'] #outputs a list of dict [{} {} {}]
    diseasesdict=diseasesdictlist[0]# outputs a dict under a dict {}
 
    return str(my_obj['nci_id']),str(my_obj['brief_title']),str(my_obj['start_date']),str(phasedict['phase']),str(sitelistdict['org_name']),str(primary_purposedict['primary_purpose_code']),str(diseasesdict['preferred_name'])
transform=lines.map(transformer)



def build_df(rdd):
    if not rdd.isEmpty():
         global ss
         df=ss.createDataFrame(rdd,schema=['nci_id','brief_title','start_date','phase','sites','primary_purpose','diseases'])
         #global sqlc
         #df=sqlc.createDataFrame(rdd,schema=['nci_id','brief_title','start_date','phase','sites','primary_purpose','diseases'])
         df.show()
         df.write.format("com.mongodb.spark.sql.DefaultSource").mode("append").save()#mongo / com.mongodb.spark.sql.DefaultSource/ joson
transform.foreachRDD(build_df)


#.mode('overwrite')\
#counts.pprint()
ssc.start()
ssc.awaitTermination()



#spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.3.1,org.apache.spark:spark-core_2.11:2.3.1,com.hortonworks:shc-core:1.1.1-2.1-s_2.11,org.mongodb.spark:mongo-spark-connector_2.11:2.3.1 --repositories http://repo.hortonworks.com/content/groups/public/  CAPkafka-sparkMongoDB.py

#https://github.com/nikunjness/mongo-ambari
#https://docs.mongodb.com/spark-connector/master/python-api/  
#https://www.youtube.com/watch?v=bKjH8WhSu_E 
#https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-centos-7
#http://www.ehadoopinfo.com/2017/08/n11-installing-mongodb-in-hdp-2223224.html

#https://tecadmin.net/tutorial/mongodb/create-database/

# TO CHECK FOR THE OUTPUT
#db.coll.find()


