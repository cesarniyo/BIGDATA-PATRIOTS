## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD JAVA FROM THE LINK BELLOW:
sudo wget http://archive.apache.org/dist/sqoop/1.4.5/sqoop-1.4.5.bin__hadoop-0.23.tar.gz

##UNTAR THE DOWNLOADED FOLDER
sudo tar xzf sqoop-1.4.5.bin__hadoop-0.23.tar.gz #

## REMOVE THE TAR VERSION
sudo mv sqoop-1.4.5.bin__hadoop-0.23 /home/cesar/opt (If not downladed there already)

## back to the root
cd


## UPDATE THE BASH PROFILE
sudo gedit .bash_profile
## SET UP SCOOP PATH ON THE BASH FILE
export SCOOP_HOME=/home/cesar/opt/sqoop-1.4.5.bin__hadoop-0.23
export PATH=$PATH:$SCOOP_HOME/bin
sudo source .bash_profile

# Go to ~/opt/sqoop-1.4.5.bin__hadoop-0.23/conf to py the template
sudo mv sqoop-env-template.cmd  sqoop-env.sh (just copying)

#Now set the path
sudo gedit sqoop-env.sh 
#Set path to where bin/hadoop is available
export HADOOP_COMMON_HOME=/home/cesar/opt/hadoop-3.1.3
#Set path to where hadoop-*-core.jar is available
export HADOOP_MAPRED_HOME=/home/cesar/opt/hadoop-3.1.3

#check scoop version
sqoop version

#check scoop home
echo $SQOOP_HOME



