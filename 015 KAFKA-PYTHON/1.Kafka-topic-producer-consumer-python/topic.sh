
#KAFKA TOPIC


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

