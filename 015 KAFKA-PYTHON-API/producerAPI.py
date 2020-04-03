from time import sleep
from json import dumps
import json
from kafka import KafkaProducer
import requests

producer = KafkaProducer(bootstrap_servers=['localhost:9096'])

r = requests.get('https://api.github.com/user', auth=('cesarniyo','123Github'))
data_dict=r.json()

data_key=['name','followers','public_repos','total_private_repos','created_at','location']
for i in data_key:
	producer.send('bigdata',json.dumps((i,':',data_dict[i])).encode('utf-8'))
	sleep(1)
	print(i,':',data_dict[i])
