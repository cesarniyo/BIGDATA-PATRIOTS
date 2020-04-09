import re
 
from pyspark import SparkContext
from pyspark.streaming import StreamingContext
from pyspark.streaming.flume import FlumeUtils
 
 


sc = SparkContext(appName="FlumeSparkStreaming")
sc.setLogLevel("ERROR")
ssc = StreamingContext(sc, 1)
 
flumeStream = FlumeUtils.createStream(ssc, "localhost", 9092)
lines = flumeStream.map(lambda x: x[1])


def transformer(rdd):
#  
#
#
#   
    return str(), str(),str()
transform=lines.map(transformer)



def build_df(rdd):
    if not rdd.isEmpty():
         global sqlc
         df=sqlc.createDataFrame(rdd,shema=['Time','Tweet','location'])
         df.show()
transform.foreachRDD(build_df)
 
ssc.start()
ssc.awaitTermination()
