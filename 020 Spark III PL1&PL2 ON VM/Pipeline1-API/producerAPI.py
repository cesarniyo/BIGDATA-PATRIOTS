from time import sleep
from json import dumps
import json
from kafka import KafkaProducer
import requests

producer = KafkaProducer(bootstrap_servers=['localhost:9096'])#(bootstrap_servers=['sandbox-hdp.hortonworks.com:6667'])


url = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php"
headers = {
    'x-rapidapi-host': "coronavirus-monitor.p.rapidapi.com",
    'x-rapidapi-key': "3cc6f15daamsh01d728b65f1b4e0p13c7a2jsna981b69014c8"
    }
r = requests.request("GET", url, headers=headers)
data_dict=r.json()


for i in data_dict['countries_stat']:
	producer.send('bigdata',json.dumps(i).encode('utf-8'))
	sleep(1)
	print(i)


#spark-submit producerAPI.py
