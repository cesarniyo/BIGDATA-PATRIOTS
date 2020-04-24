
#HOW TO UPLOAD A FILE TO HDFS FROM LOCAL
#Start/Stop all
start-all.sh ##stop-all.sh

#Check all
jps


#TROUBLE-SHOT (#hadoop-daemon.sh start tasktracker)
#hadoop-daemon.sh start tasktracker
#hadoop-daemon.sh start datanode
#hadoop-daemon.sh start namenode

#Creating a Directory on hdfs
hdfs dfs -mkdir /test
hdfs dfs -ls /
hdfs dfs -put /home/cesar/Desktop/shakespeare.txt /test
hdfs dfs -ls /test
#hdfs dfs -rm /test/shakespeare.txt
#hdfs dfs -rmdir /test

