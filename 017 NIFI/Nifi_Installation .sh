
#HOW TO INSTALL Nifi

# The following command tells the system that we are install from the bash file
#!/bin/bash


## create new directory
#mkdir opt


## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD KAFKA FROM THE LINK BELLOW:
sudo wget http://archive.apache.org/dist/nifi/1.9.2/nifi-1.9.2-bin.tar.gz

##UNTAR THE DOWNLOADED FOLDER
sudo tar xzf  nifi-1.9.2-bin.tar.gz ##-xzvf 

## REMOVE THE TAR VERSION
#sudo rm kafka_2.11-2.3.1.tgz

## back to the root
cd


## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

## CREATING HOME
echo "export NIFI_HOME=/home/cesar/opt/nifi-1.9.2" >> .bash_profile
echo "export PATH=$PATH:$NIFI_HOME/bin" >> .bash_profile

source .bash_profile
echo $NIFI_HOME

cd to /home/opt/nifi-1.9.2/conf change web propertie to nifi.web.http.port=8090
cd home

nifi.sh status
nifi.sh start/ stop

Go to browser: http://localhost:8090
Drag resources and configure them........





