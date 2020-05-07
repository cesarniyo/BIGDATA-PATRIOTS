
from pyspark import SparkContext,SQLContext,Row
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
from pyspark.streaming.kinesis import KinesisUtils, InitialPositionInStream
from pyspark.storagelevel import StorageLevel
import json


sc = SparkContext()
ssc = StreamingContext(sc, 5)
sqlc= SQLContext(sc)

appName="kenesis-spark"
streamName="mystream"
endpointUrl="https://kinesis.us-east-2.amazonaws.com"
regionName = "us-east-2"

awsAccessKeyId = "AKIAJX5HOOSXGZI5AQXA"
awsSecretKey = "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"

#LATEST
#TRIM_HORIZON


records = KinesisUtils.createStream(ssc, appName, streamName, endpointUrl, regionName, InitialPositionInStream.LATEST, 2, StorageLevel.MEMORY_AND_DISK_2, awsAccessKeyId,awsSecretKey)


def transformer(rdd):
    my_obj=json.loads(rdd)
    return my_obj['country_name'].encode('utf-8'),my_obj['cases'].encode('utf-8'),my_obj['region'].encode('utf-8'),my_obj['new_cases'].encode('utf-8'),my_obj['serious_critical'].encode('utf-8')
transform=records.map(transformer)


def build_df(rdd):
    if not rdd.isEmpty():
         global sqlc
         df=sqlc.createDataFrame(rdd,schema=['country_name','cases','region','new_cases','serious_critical'])
         #df.show()      
         df.write.format('jdbc').options(url='jdbc:mysql://database-1.chd2q5zdvmdz.us-east-2.rds.amazonaws.com:3306/mytable',driver='com.mysql.jdbc.Driver',dbtable='mytable',user='admin',password='123admin').mode('append').save()
         df.show()
transform.foreachRDD(build_df)



#transform.pprint()
ssc.start()
ssc.awaitTermination()


'''
import boto
from time import sleep
import json
import requests
import sys
import pandas as pd

client = boto.client('kinesis')
sharditerator=client.get_shard_iterator(StreamName='mystream',ShardId='shardId-000000000000', ShardIteratorType='TRIM_HORIZON')
response =  client.get_records(ShardIterator = str(sharditerator[u'ShardIterator']))

objectlist=[]
while 'NextShardIterator' in response :
     try:
        response = client.get_records(ShardIterator=response['NextShardIterator'])
        userrecords=response[u'Records']
        userdata=userrecords[0]
        my_obj = json.loads(userdata[u'Data'])
        #objectlis.append(my_obj)
        df = pd.DataFrame({'country_name':my_obj['country_name'],'cases':my_obj['cases']}, index=[0])
        print(df)
     except:
         continue

for i in objectlist:
    print(i)
    #df = pd.DataFrame({'country_name':my_obj['country_name'],'cases':my_obj['cases']}, index=[0])
    #print(df)

'''


#spark-submit --packages org.apache.spark:spark-streaming-kinesis-asl_2.11:2.4.4 s3://my-bucket3/kinesis-EMR.py
#spark-submit --jars s3://my-bucket3/mysql-connector-java-8.0.20.jar  --packages org.apache.spark:spark-streaming-kinesis-asl_2.11:2.4.4 s3://my-bucket3/kinesis-EMR.py



#https://github.com/apache/spark/blob/master/external/kinesis-asl/src/main/python/examples/streaming/kinesis_wordcount_asl.py
#https://www.themarketingtechnologist.co/upload-your-local-spark-script-to-an-aws-emr-cluster-using-a-simply-python-script/







