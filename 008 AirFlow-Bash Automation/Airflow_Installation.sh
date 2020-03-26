#HOW TO INSTALL Airflow

# The followng command tells the system  that we are installing from the bash file
#!/bin/bash


#INSTALLING PYTHON AND PIP  (DAGs)
sudo apt-get install python-setuptools
sudo apt-get install python-pip
sudo pip install --upgrade pip



#INSTALLING POSTGRESQL FOR AIRFLOW 
sudo apt-get install postgresql postgresql-contrib
sudo -u postgres psql  #A command line tool to access the Postgres.

#After  logging in successfully, we will get psql prompt (postgres=#). We will create a new user and provide privileges to it

CREATE ROLE ubuntu;
CREATE DATABASE airflow;
GRANT ALL PRIVILEGES on database airflow to ubuntu;
ALTER ROLE ubuntu SUPERUSER;
ALTER ROLE ubuntu CREATEDB;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to ubuntu;

#Now connect to airflow database and get connection information.
postgres-# \c airflow

#After successful connection, prompt will be changed to airflow-#. We will verify this by fetching connection info
airflow=# \conninfo

#We’ll change settings in pg_hb.conf file for required configuration as per Airflow. You can run command SHOW hba_file to find location of pg_hba.conf file.Most likely located at pg_hb.conf located at /etc/postgresql/*/main/pg_hba.conf
#open this file with vim and change ipv4 address to 0.0.0.0/0 and listen_addresses to listen_addresses = ‘*’.

#We will restart PostgreSQL to load changes.
sudo service postgresql restart



#INSTALLING AIRFLOW
#As PostgreSQL is already installed and configured. Next, We will install Airflow
export AIRFLOW_HOME=~/airflow


#Install Ubuntu dependencies required for Apache Airflow.
sudo apt-get install libmysqlclient-dev #( for airflow airflow mysql )
sudo apt-get install libssl-dev         #(for airflow cryptograph package)
sudo apt-get install libkrb5-dev        #(for airflow kerbero package )
sudo apt-get install libsasl2-dev       #(for airflow hive package )



#After installing dependencies, Install Airflow and its packages.
sudo pip install apache-airflow

#After successfully installing airflow, we will initialise Airflow’s database
airflow initdb

#We will be using CeleryExecutor instead of SequentialExecutor which come by default with airflow
executor = CeleryExecutor

#For DB connection we will pass PostgreSQL database ‘airflow’, that we have created in earlier step.
sql_alchemy_conn = postgresql+psycopg2://ubuntu@localhost:5432/airflow

#Change broker_url and celery_result_backend to the same config, as shown below
broker_url = amqp://guest:guest@localhost:5672//
celery_result_backend = amqp://guest:guest@localhost:5672//

#For Loading new configurations, we should run
airflow initdb

#INSTALLING Rabbitmq
#Rabbitmq is a message broker, that required to rerun airflow dags with celery. Rabbitmq can be installed with following command.
sudo apt install rabbitmq-server

#We will change configuration NODE_IP_ADDRESS=0.0.0.0 in configuration file located at
/etc/rabbitmq/rabbitmq-env.conf

#Now Start RabbitMQ service
sudo service rabbitmq-server start

#INSTALLING Celery
#Celery is a python api for rabbitmq, We can install celery using pip
sudo pip install celery

#you can install higher version with
sudo pip uninstall celery

#STARTING AIRFLOW 
mkdir -p /home/ubuntu/airflow/dags/

#and then we’ll start all airflow services to up airflow webUI
airflow webserver
airflow scheduler
airflow worker

#STOPPPING Aiflow
cat $AIRFLOW_HOME/airflow-webserver.pid
sudo kill -9 {process_id of airflow}


#https://vujade.co/install-apache-airflow-ubuntu-18-04/






