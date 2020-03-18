#!/bin/bash

#HOW TO INSTALL PYTHON

sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

## CREATING NEW DIRECTORY
mkdir opt


## GO TO opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD PYTHON FROM THE LINK BELLOW:
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

##EXTRACT TGZIPPED 
sudo tar -xf Python-3.7.4.tgz

## REMOVE THE ZIP VERSION
sudo rm Python-3.7.4.tgz

## GO TO PYTHON FOLDER
cd Python-3.7.4
sudo ./configure --enable-optimizations

## START THE PYTHON BUILD PROCESS USING MAKE
make -j 4

## BINARIES BY RUNNING 
sudo make altinstall #altinstall

#BACK TO THE ROOT
#cd 

## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

##SET UP PYTHON PATH ON THE BASH FILE
echo "PYTHON_HOME=home/cesar/opt/Python-3.7.4" >> .bash_profile
echo "export PATH=$PATH:$PYTHON_HOME/bin" >> .bash_profile


## SOURCING THE BASH
sudo source .bash_profile


## CHECK PYTHON VERSION
python3.7 --version

## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS: 
## bash /home/cesar/Desktop/Auto_installation/python_Installation.sh

