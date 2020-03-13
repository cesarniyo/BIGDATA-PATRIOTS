#!/bin/bash

#HOW TO INSTALL JAVA

## create new directory
mkdir opt


## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD JAVA FROM THE LINK BELLOW:
wget -O jdk-8u221-linux-x64.tar.gz \
-c --content-disposition \
"https://javadl.oracle.com/webapps/download/AutoDL?BundleId=239835_230deb18db3e4014bb8e3e8324f81b43"

##UNTAR THE DOWNLOADED FOLDER
tar -zxvf jdk-8u221-linux-x64.tar.gz

## REMOVE THE TAR VERSION
rm jdk-8u221-linux-x64.tar.gz

## back to the root
cd


## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

##SET UP JAVA PATH ON THE BASH FILE
echo JAVA_HOME=/opt/jdk1.8.0_221 >>sudo .bash_profile
echo export PATH=$PATH:$JAVA_HOME/bin >>sudo .bash_profile




## SOURCING THE BASH
source .bash_profile


## CHECK JAVA VERSION
java -version


## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS:
## bash /home/fieldemployee/Desktop/Auto_installation/java_Installation.sh
