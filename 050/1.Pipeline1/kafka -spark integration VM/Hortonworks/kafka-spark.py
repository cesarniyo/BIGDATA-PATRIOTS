
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


#os.environ['PYSPARK_SUBMIT_ARGS'] = '--jars spark-streaming-kafka-0-8-assembly_2.11-2.3.0.jar pyspark-shell'
#os.environ['PYSPARK_SUBMIT_ARGS'] = '--jars shc-core-1.1.1-1.6-s_2.10.jar pyspark-shell'
#os.environ['PYSPARK_SUBMIT_ARGS'] = '--jars spark-core_2.11-2.3.0.jar pyspark-shell'


sc = SparkContext()
ssc = StreamingContext(sc, 10) 
sqlc= SQLContext(sc)    
kvs = KafkaUtils.createDirectStream(ssc, ['bigdata'], {'metadata.broker.list': 'sandbox-hdp.hortonworks.com:6667'})    
lines = kvs.map(lambda x: x[1])


def transformer(rdd):
    my_obj=json.loads(rdd)
    now = datetime.now()
    dt_string = now.strftime("%m/%d/%Y %H:%M:%S")# mm/dd/YY H:M:S
    return str(dt_string), str(my_obj['country_name']),str(my_obj['cases']),str(my_obj['region']),str(my_obj['new_cases']),str(my_obj['serious_critical'])
transform=lines.map(transformer)


import happybase
server = "sandbox-hdp.hortonworks.com"
table_name = "/tables/coronavirusdata"


def data_insert(transformedrdd):
     table = happybase.Connection(server).table(table_name) 
     line=list(transformedrdd)
     key = line[0]
     value = {"info:country name": line[1]
               ,"info:cases": line[2]
               ,"info:region": line[3]
               ,"info:new_cases": line[4]
               ,"info:serious_critical": line[5]
                }
      # Look at jupyter console to see the print output
      print(key, value)
      table.put(key, value)
    
transform.foreachPartition(data_insert)




data_source_format = "org.apache.spark.sql.execution.datasources.hbase"
# ''.join(string.split()) in order to write a multi-line JSON string here.
catalog = ''.join("""{
    "table":{"namespace":"defaul", "name":"coronavirusdata"},
    "rowkey":"key",
    "columns":{
        "Time Frame":{"cf":"rowkey", "col":"key", "type":"string"},
        "country name":{"cf":"location", "col":"country name", "type":"string"},
        "cases":{"cf":"info", "col":"cases", "type":"string"},
        "region":{"cf":"info", "col":"region", "type":"string"},
        "new_cases":{"cf":"info", "col":"new_cases", "type":"string"},
        "serious_critical":{"cf":"info","col":"serious_critical", "type":"string"}
      }
}""".split())#.encode('utf-8').split())



def build_df(rdd):
    if not rdd.isEmpty():
         global sqlc
         df=sqlc.createDataFrame(rdd,schema=['Time Frame','country name','cases','region','new_cases','serious_critical'])
         df.show()

	 #Writing to Hbase
	 df.write\
         .options(catalog=catalog)\
         .option('newtable',5)\
         .format(data_source_format)\
         .save()

         #.option('newtable'=5)\
         # Reading from Hbase
         #df = sqlc.read\
         #.options('catalog',catalog)\
         #.format(data_source_format)\
         #.load()
         #df.show
transform.foreachRDD(build_df)

#.mode('overwrite')\


#counts.pprint()
ssc.start()
ssc.awaitTermination()



#spark-submit --jars spark-core_2.11-1.5.2.logging.jar --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.3.0,com.hortonworks:shc-core:1.1.1-2.1-s_2.11 --repositories http://repo.hortonworks.com/content/groups/public/  kafka-spark.py


#spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.3.1,org.apache.spark:spark-core_2.11:2.3.1,com.hortonworks:shc-core:1.1.1-2.1-s_2.11 --repositories http://repo.hortonworks.com/content/groups/public/  kafka-spark.py







