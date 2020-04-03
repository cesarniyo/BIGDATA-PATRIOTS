from json import loads
from kafka import KafkaConsumer


consumer= KafkaConsumer('bigdata',bootstrap_servers=['localhost:9096'],auto_offset_reset='earliest')
f=open('/home/cesar/Desktop/PC/shakespeare.txt','w')

for message in consumer:
      message = message.value
      f.write(message.decode('utf-8'))
f.close()
