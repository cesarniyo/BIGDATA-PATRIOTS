import pykafka
import json
import tweepy
from tweepy import OAuthHandler
from tweepy import Stream
from tweepy.streaming import StreamListener



#TWITTER API CONFIGURATIONS
consumer_key = "uX0TWqkx0okYEjjqLzxIx6mD6" 
consumer_secret = "rzHIs3TMJnADbZNvdGU7LQUo0kPxPISq3RGSLfqcBip39X5END" 
access_token = "559516596-yDA9xqOljo4CV32wSnqsx2BXh4RBIRKFxZGSZrPC" 
access_secret = "zDxePILZitS5tIWBhre0GWqps0FIj9OadX8RZb6w8ZCwz"


#TWITTER API AUTH
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)

api = tweepy.API(auth)

#Twitter Stream Listener
class KafkaPushListener(StreamListener):          
	def __init__(self):
		#localhost:9092 = Default Zookeeper Producer Host and Port Adresses
		self.client = pykafka.KafkaClient('sandbox-hdp.hortonworks.com:6667')
		
		#Get Producer that has topic name is Twitter
		self.producer = self.client.topics[bytes("twitter").encode('utf-8')].get_producer() #,"ascii" .encode('utf-8')
  
	def on_data(self, data):
		#Producer produces data for consumer
		#Data comes from Twitter
		self.producer.produce(bytes(data).encode('utf-8'))
		return True
                                                                                                                                           
	def on_error(self, status):
		print(status)
		return True

#Twitter Stream Config
twitter_stream = Stream(auth, KafkaPushListener())

#Produce Data that has homeschooling hashtag (Tweets)
twitter_stream.filter(track=['#homeschooling'])


#spark-submit Tproducer.py
