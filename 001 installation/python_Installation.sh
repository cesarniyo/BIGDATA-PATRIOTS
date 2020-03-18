#!/bin/bash

#HOW TO INSTALL PYTHON

## CREATING NEW DIRECTORY
mkdir opt


## GO TO opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD PYTHON FROM THE LINK BELLOW:
sudo wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

##EXTRACT TGZIPPED 
sudo tar -xf Python-3.7.4.tgz

## REMOVE THE ZIP VERSION
sudo rm Python-3.7.4.tgz

## GO TO PYTHON FOLDER
cd Python-3.7.4
./configure --enable-optimizations

## START THE PYTHON BUILD PROCESS USING MAKE
sudo make -j 4

## BINARIES BY RUNNING 
sudo make install #altinstall

#BACK TO THE ROOT
cd 

## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

##SET UP PYTHON PATH ON THE BASH FILE
echo "PYTHON_HOME=/opt/Python-3.7.4" >> .bash_profile
echo "export PATH=$PATH:$PYTHON_HOME/bin" >> .bash_profile


## SOURCING THE BASH
sudo source .bash_profile


## CHECK PYTHON VERSION
python3.7 --version

## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS: 
## bash /home/fieldemployee/Desktop/Auto_installation/python_Installation.sh

