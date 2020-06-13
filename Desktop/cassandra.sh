# Cassandra on Hortonworks

TERMINAL
Start your local Terminal and then do:
ssh  maria_dev@localhost -p 2222
password:maria_dev


#CLONING cassandra to Hortonworks
[maria_dev@sandbox-hdp ~] cd /var/lib/ambari-server/resources/stacks/HDP/3.0/services
[maria_dev@sandbox-hdp ~services]git clone https://github.com/Symantec/ambari-cassandra-service.git

=>Restart all the services

AMBARI ADMIN RIGHT SETUP:
logged in as maria_dev then:
[maria_dev@sandbox-hdp ~]$ambari-admin-password-reset
 password:admin

LOGIN AS ADMIN AND GO TO:
services-> Add service -> check cassandra -> Next (on the next page) -> Next (on the next page) -> Next (on the next page) -> Deploy

=>Restart all the services
---------------------------------------------------------------------------------------------------------------------------------------
#SETTING UP MongoDB inside the CODE
#Create Spark session with MongoDB supported.
appName = "PySpark MongoDB Example"
ss = SparkSession \
    .builder \
    .appName(appName) \
    .config("spark.mongodb.input.uri", "mongodb://sandbox-hdp.hortonworks.com:27017/test.coll") \
    .config("spark.mongodb.output.uri", "mongodb://sandbox-hdp.hortonworks.com:27017/test.coll") \
    .getOrCreate()
sqlc= SQLContext(sc)


def build_df(rdd):
    if not rdd.isEmpty():
         global ss
         df=ss.createDataFrame(rdd,schema=['nci_id','brief_title','start_date','phase','sites','primary_purpose','diseases'])
         #global sqlc
         #df=sqlc.createDataFrame(rdd,schema=['nci_id','brief_title','start_date','phase','sites','primary_purpose','diseases'])
         df.show()
	 df.write\
	   .format("org.apache.spark.sql.cassandra")\
	   .mode('append')\
	   .options(table="kv", keyspace="test")\
	   .save()

transform.foreachRDD(build_df)
----------------------------------------------------------------------------------------------------------------------------------------


# TO CHECK FOR THE OUTPUT
>show dbs
>use test
>db.coll.find()



REF
https://github.com/datastax/spark-cassandra-connector/blob/master/doc/15_python.md





