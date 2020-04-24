import sys
import os
from pyspark import SparkContext, SparkConf
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
os.environ['PYSPARK_SUBMIT_ARGS'] = '--jars /spark-2.4.4-bin-hadoop2.7/spark-streaming-kafka-0-8-assembly_2.11-2.1.0.jar pyspark-shell'


sc = SparkContext()#(appName=”PythonStreamingRecieverKafkaWordCount”)
ssc = StreamingContext(sc, 5) # 2 second window     
kvs = KafkaUtils.createDirectStream(ssc, ['bigdata'], {'metadata.broker.list': 'localhost:9096'})    
lines = kvs.map(lambda x: x[1])

counts = lines.flatMap(lambda line: line.split('')) \
          .map(lambda word: (word, 1)) \
          .reduceByKey(lambda a, b: a+b)  
  
counts.pprint()
ssc.start()
ssc.awaitTermination()

#$ bin/spark-submit — packages org.apache.spark:spark-streaming-kafka-0–8_2.11:2.0.0 /home/cesar/Desktop/spark/kafka-spark.py localhost:9096 bigdata
