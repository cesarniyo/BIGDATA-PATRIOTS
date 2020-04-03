
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
echo "export KAFKA_HOME=/home/cesar/opt/kafka-2.3.1" >> .bash_profile
echo "export PATH=$PATH:$KAFKA_HOME/bin" >> .bash_profile

source .bash_profile

echo $KAFKA_HOME


## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS:
## bash /home/fieldemployee/Desktop/Auto_installation/Kafka_Installation.sh
