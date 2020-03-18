
#HOW TO INSTALL Hadoop

# The following command tells the system that we are install from the bash file
#!/bin/bash


## install ssh-server
sudo apt-get purge openssh-server
sudo apt-get install openssh-server

## generate private and public keys
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

## create new directory
#mkdir opt


## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD JAVA FROM THE LINK BELLOW:
sudo wget https://downloads.apache.org/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz

##UNTAR THE DOWNLOADED FOLDER
sudo tar xzf hadoop-3.1.3.tar.gz ##-xzvf hadoop-3.1.3.tar.gz

## REMOVE THE TAR VERSION
sudo mv hadoop-3.1.3 /usr/local

## back to the root
cd


## CREATE THE BASH FILE + SAVE
sudo gedit .bash_profile

##SET UP HADOOP PATH ON THE BASH FILE
export HADOOP_HOME=/usr/local/hadoop-3.1.3
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin


## SOURCING THE BASH
source .bash_profile


#HADOOP CONFIG FILES (sudo gedit core-site.xml => then pest the command in there)

#core-site.xml
<configuration>
<property>
     <name>fs.default.name</name>
     <value>hdfs://localhost:9000</value>
</property>
</configuration>


#Create namenode and datanode  folder and then copy the path to hdfs-site.xml
mkdir hdfs/namenode
mkdir hdfs/datanode

#hdfs-site.xml
<configuration>
<property>
   <name>dfs.replication</name>
   <value>1</value>
</property>
<property>
    <name>dfs.name.dir</name>
    <value>file:////home/cesar/hdfs/namenode</value>
</property>
<property>
    <name>dfs.data.dir</name>
    <value>file:////home/cesar/hdfs/datanode</value>
</property>
</configuration>

#yarn-site.xml
<configuration>
 <property>
  <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
 </property>
</configuration>

#mapred-site.xml

<configuration>
 <property>
  <name>mapreduce.framework.name</name>
   <value>yarn</value>
 </property>
 <property>
   <name>yarn.app.mapreduce.am.env</name>
   <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
 </property>
 <property>
   <name>mapreduce.map.env</name>
   <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
 </property>
 <property>
   <name>mapreduce.reduce.env</name>
   <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
 </property>
</configuration>


#Format Namenode
hdfs namenode -format

#Start Hadoop Cluster
cd $HADOOP_HOME/sbin/

#Start dfs
./start-dfs.sh

#Start yarn
./start-yarn.sh

#Start/Stop all
$ start-all.sh /stop-all.sh

#Check all
$ jps

#Creating a Directory on hdfs
$ hdfs dfs -mkdir /test
$ hdfs dfs -ls /
$ hdfs dfs -put /home/cesar/Desktop/shakespeare.txt /test
$ hdfs dfs -ls /test
$ hdfs dfs -rm /test/shakespeare.txt
$ hdfs dfs -rmdir /test


#Check Hadoop version
$ hadoop version

#Check hdfs version
$ hdfs version

#check thru browser
localhost:9870


## FROM THE ROOT RUN THE BASH FILE AS FOLLOWS:
## bash /home/fieldemployee/Desktop/Auto_installation/Hodoop_Installation.sh
