from time import sleep
from json import dumps
import json

import boto3
import requests


client = boto3.client('kinesis')
shardlist=[]

url = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php"
headers = {
    'x-rapidapi-host': "coronavirus-monitor.p.rapidapi.com",
    'x-rapidapi-key': "3cc6f15daamsh01d728b65f1b4e0p13c7a2jsna981b69014c8"
    }
r = requests.request("GET", url, headers=headers)
data_dict=r.json()

for i in range(0,1):
   for i in data_dict['countries_stat']:
	#shardlist.append(client.put_record(StreamName ='mystream',Data=json.dumps(i).encode('utf-8'),PartitionKey=str(r)))#
        shardlist.append(client.put_record(StreamName ='mystream',Data=json.dumps(i),PartitionKey=str(r)))#
	sleep(1)
	print(i)


#python AWSproducerAPI.py
#aws kinesis describe-stream --stream-name A-STREAM --region us-east-2
