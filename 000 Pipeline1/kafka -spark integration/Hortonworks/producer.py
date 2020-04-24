from time import sleep
from json import dumps
import json
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers=['localhost:9096'])

f=open('/home/cesar/Desktop/shakespeare.txt','r')
line_list=f.readlines()

for i in range(len(line_list)):
	producer.send('bigdata',json.dumps(line_list[i]).encode('utf-8'))
	sleep(1)
	print(i)
