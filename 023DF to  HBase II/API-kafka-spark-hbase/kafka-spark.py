
import sys
# encoding=utf8
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import time
from datetime import datetime
import json

from pyspark import SparkContext, SparkConf,SQLContext
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
from pyspark.sql import SparkSession
from pyspark.sql import HiveContext



sc = SparkContext()
ssc = StreamingContext(sc, 10) # 10 Second window to get the stream from the source
sqlc= SQLContext(sc) 
  
kvs = KafkaUtils.createDirectStream(ssc, ['bigdata'], {'metadata.broker.list': 'sandbox-hdp.hortonworks.com:6667'})    
lines = kvs.map(lambda x: x[1])


def transformer(rdd):
    my_obj=json.loads(rdd)
    now = datetime.now()
    dt_string = now.strftime("%m/%d/%Y %H:%M:%S")# mm/dd/YY H:M:S
    #return str(dt_string),str(my_obj['country_name']),str(my_obj['cases']),str(my_obj['region']),str(my_obj['new_cases']),str(my_obj['serious_critical'])
    return dt_string,my_obj['country_name'],my_obj['cases'],my_obj['region'],my_obj['new_cases'],my_obj['serious_critical']
transform=lines.map(transformer)



#Defining the data format
data_source_format = "org.apache.spark.sql.execution.datasources.hbase"

#Designing the catalogue
# ''.join(string.split()) in order to write a multi-line JSON string here.
catalog = ''.join("""{
    "table":{"namespace":"defaul", "name":"coronavirusdata"},
    "rowkey":"key",
    "columns":{
        "Time_Frame":{"cf":"rowkey", "col":"key", "type":"string"},
        "country_name":{"cf":"location", "col":"country name", "type":"string"},
        "cases":{"cf":"info", "col":"cases", "type":"string"},
        "region":{"cf":"info", "col":"region", "type":"string"},
        "new_cases":{"cf":"info", "col":"new_cases", "type":"string"},
        "serious_critical":{"cf":"info","col":"serious_critical", "type":"string"}
      }
}""".split())#.encode('utf-8').split())



def build_df(rdd):
    if not rdd.isEmpty():
         global sqlc
         df=sqlc.createDataFrame(rdd,schema=['Time_Frame','country_name','cases','region','new_cases','serious_critical'])
         df.show()
	 #Writing to Hbase
	 df.write\
         .options(catalog=catalog)\
         .option('newtable',5)\
         .format(data_source_format)\
         .save()

         # Reading from Hbase
         df = sqlc.read\
         .options('catalog',catalog)\
         .format(data_source_format)\
         .load()
         df.show
transform.foreachRDD(build_df)



#counts.pprint()
ssc.start()
ssc.awaitTermination()



#spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.3.1,org.apache.spark:spark-core_2.11:2.3.1,com.hortonworks:shc-core:1.1.1-2.1-s_2.11 --repositories http://repo.hortonworks.com/content/groups/public/  kafka-spark.py


#spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.3.1,org.apache.spark:spark-core_2.11:2.3.1,com.hortonworks:shc-core:1.1.0-2.1-s_2.11 --repositories http://repo.hortonworks.com/content/groups/public/  kafka-spark.py






