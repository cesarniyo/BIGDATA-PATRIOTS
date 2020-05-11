from time import sleep
from json import dumps
import json
from kafka import KafkaProducer
import requests

producer = KafkaProducer(bootstrap_servers=['sandbox-hdp.hortonworks.com:6667'])


url = "https://clinicaltrialsapi.cancer.gov/v1/clinical-trials?record_verification_date_gte=2020-04-10"
response = requests.request("GET", url)
data_dict=response.json()
data_dict_list=data_dict['trials']

for i in range(0,1000):# Get data from API 1000 times
    for i in data_dict_list:
	    producer.send('bigdata',json.dumps(i).encode('utf-8'))
	    sleep(1)
	    print(i)


#spark-submit producerAPI.py
