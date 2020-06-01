import sys
import os
import time
from datetime import datetime
import json

from pyspark import SparkContext, SparkConf,SQLContext
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
os.environ['PYSPARK_SUBMIT_ARGS'] = '--jars /spark-2.4.4-bin-hadoop2.7/spark-streaming-kafka-0-8-assembly_2.11-2.1.0.jar pyspark-shell'


sc = SparkContext()#(appName=”PythonStreamingRecieverKafkaWordCount”)
ssc = StreamingContext(sc, 5) # 2 second window
sqlc= SQLContext(sc)    
kvs = KafkaUtils.createDirectStream(ssc, ['bigdata'], {'metadata.broker.list': 'localhost:9096'})    
lines = kvs.map(lambda x: x[1])


def transformer(rdd):
    my_obj=json.loads(rdd)
    now = datetime.now()
    dt_string = now.strftime("%m/%d/%Y %H:%M:%S")# dd/mm/YY H:M:S
    return str(dt_string), str(my_obj['country_name']),str(my_obj['cases']),str(my_obj['region']),str(my_obj['new_cases']),str(my_obj['serious_critical'])
transform=lines.map(transformer)


def build_df(rdd):
    if not rdd.isEmpty():
         global sqlc
         df=sqlc.createDataFrame(rdd,schema=['Time Frame','country name','cases','region','new_cases','serious_critical'])
         df.show()
transform.foreachRDD(build_df)




#counts.pprint()
ssc.start()
ssc.awaitTermination()

#$ bin/spark-submit — packages org.apache.spark:spark-streaming-kafka-0–8_2.11:2.0.0 /home/cesar/Desktop/spark/kafka-spark.py localhost:9096 bigdata
