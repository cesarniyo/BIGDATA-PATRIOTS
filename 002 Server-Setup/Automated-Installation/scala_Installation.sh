#!/bin/bash

#HOW TO INSTALL SCALA

## CREATE NEW DIRECTORY
mkdir opt


## GO TO opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD SCALA FROM THE LINK BELLOW:
wget www.scala-lang.org/files/archive/scala-2.11.8.deb

##UNTAR THE DOWNLOADED FOLDER
dpkg -i scala-2.11.8.deb

## back to the root
cd


## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

##SET UP SCALA PATH ON THE BASH FILE
echo "SCALA_HOME=/home/cesar/opt/scala-2.11.8.bed" >> .bash_profile
echo "export PATH=$PATH:$SCALA_HOME/bin" >> .bash_profile



## SOURCING THE BASH
source .bash_profile


## CHECK SCALA VERSION
scala -version


## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS:
## bash /home/fieldemployee/Desktop/Auto_installation/scala_Installation.sh
