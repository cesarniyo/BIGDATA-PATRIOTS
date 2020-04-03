
#HOW TO INSTALL Kafka

# The following command tells the system that we are install from the bash file
#!/bin/bash


## create new directory
#mkdir opt


## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD KAFKA FROM THE LINK BELLOW:
sudo wget https://www-eu.apache.org/dist/kafka/2.3.1/kafka_2.11-2.3.1.tgz
##UNTAR THE DOWNLOADED FOLDER
sudo tar xzf kafka_2.11-2.3.1.tgz ##-xzvf 

## REMOVE THE TAR VERSION
#sudo rm kafka_2.11-2.3.1.tgz

## back to the root
cd


## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

## CREATING HOME
echo "export KAFKA_HOME=/home/cesar/opt/kafka_2.11-2.3.1" >> .bash_profile
echo "export PATH=$PATH:$KAFKA_HOME/bin" >> .bash_profile

source .bash_profile

echo $KAFKA_HOME

cp server.properties server-kafkatest
sudo gedit server-kafkatest

uncomment + change the number to 9096
brokerid=1
listeners = PLAINTEXT://your.host.name:9096     
listeners=PLAINTEXT://:9096

source .bash_profiles


# TEST
#start zookeeper 
zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties 

#start kafka 
kafka-server-start.sh $KAFKA_HOME/config/server-kafkatest.properties
$jps


#create a topic
kafka-topics.sh --create --bootstrap-server localhost:2181 --replication-factor 1 --partitions 1 --topic kafkatest
#describe a created topic
kafka-topics.sh --describe --zookeeper localhost:2181 --topic 'topic name'

kafka-console-producer.sh --broker-list localhost:9096 --topic kafkatest
kafka-console-consumer.sh --bootstrap-server localhost:9096 --topic kafkatest --from-beginning


#ASSIGNMENT
sudo apt-get update
sudo apt-get -y install python3-pip
pip install kafka-python
******************************************************************************************************
#Create a topic
kafka-topics.sh --create --bootstrap-server localhost:2181 --replication-factor 1 --partitions 1 --topic bigdata
********************************************************************************************************

#Create a procuder
from time import sleep
form json import dumps
import json
from kafka import KafkaProducer

producer = KafkaProcuder(bootstrap_servers=['localhost:9096','localhost:9097','localhost:9098'])
f=open('/home,cesar/Desktop/shakespeare.txt','r')
line_list=f.readlines()

for i in range(len(line_list):
      producer.send('bigdata',json.dumps(line_list[i].encode('utf-8')
      sleep(1)
*******************************************************************************************************

#Create a consumer
from time import sleep
form json import dumps
import json
from json import loads
from kafka import KafkaConsumer


consumer = KafkaConsumer('bigdata',bootstrap_servers=['localhost:9096','localhost:9097','localhost:9098'],auto_offset_reset='earliest')
f=open('/home/cesar/Desktop/shakespeare.txt','w')
line_list=f.readlines()

for message in consumer:
      message = message.value
      f.write(message.decode('utf-8'))
f.close()
********************************************************************************************************


## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS:
## bash /home/fieldemployee/Desktop/Auto_installation/Kafka_Installation.sh

