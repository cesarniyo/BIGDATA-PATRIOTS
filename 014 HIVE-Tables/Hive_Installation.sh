# HIVE INSTALLATION

## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD HIVE FROM THE LINK BELLOW:
sudo wget https://archive.apache.org/dist/hive/hive-2.3.5/apache-hive-2.3.5-bin.tar.gz
sudo wget https://archive.apache.org/dist/hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz
##UNTAR THE DOWNLOADED FOLDER
sudo tar -xzf apache-hive-3.1.1-bin.tar.gz #

mv apache-hive-3.1.1-bin apache-hive-3.1.1

## back to the root
cd


## UPDATE THE BASH PROFILE
sudo gedit .bash_profile
## SET UP HIVE PATH ON THE BASH FILE
export HIVE_HOME=/home/cesar/opt/apache-hive-3.1.1
export PATH=$PATH:$HIVE_HOME/bin
sudo source .bash_profile

jps
hdfs dfs -ls /
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hive
hdfs dfs -mkdir /user/hive/warehouse
hdfs dfs -mkdir /temp


hdfs dfs -ls /


hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -chmod g+w /tmp


# new tab : to to .bash_profile (leave it there)

cd opt/apache-hive-3.1.1/
opt/apache-hive-3.1.1/ls     in hive directory
cd /apache-hive-3.1.1 mkdir hive
ls
cd hive  do pwd


# open new tab 1 
cd /apache-hive-3.1.1/conf/ls
cd /apache-hive-3.1.1/conf/ cp hive-env.sh.template hive-env.sh
d /apache-hive-3.1.1/conf/ sudo gedit hive-env.sh
export HADOOP_HEAPSIZE=512
export HADOOP_HOME=/home/cesar/opt/hadoop-3.1.3
export HIVE_CONF_DIR=/home/cesar/opt/apache-hive-3.1.1/conf


save.....
cd /apache-hive-3.1.1/conf
cp hive-default.xml.template  hive-site.xml
sudo gedit hive-site.xml    (copy the properties form github)


#*******************************apache-hive-2.3.5************************************
<configuration>
<property>
<name>javax.jdo.option.ConnectionURL</name>
<value>jdbc:derby:;databaseName=/home/cesar/opt/apache-hive-3.1.1/hive/metastore_db;create=true</value>
<description>
JDBC connect string for a JDBC metastore.
To use SSL to encrypt/authenticate the connection, provide database-specific SSL flag in the connection URL.
For example, jdbc:postgresql://myhost/db?ssl=true for postgres database.
</description>
</property>
<property>
<name>hive.metastore.warehouse.dir</name>
<value>/user/hive/warehouse</value>
<description>location of default database for the warehouse</description>
</property>
<property>
<name>hive.metastore.uris</name>
<value/>
<description>Thrift URI for the remote metastore. Used by metastore client to connect to remote metastore.</description>
</property>
<property>
<name>javax.jdo.option.ConnectionDriverName</name>
<value>org.apache.derby.jdbc.EmbeddedDriver</value>
<description>Driver class name for a JDBC metastore</description>
</property>
<property>
<name>javax.jdo.PersistenceManagerFactoryClass</name>
<value>org.datanucleus.api.jdo.JDOPersistenceManagerFactory</value>
<description>class implementing the jdo persistence</description>
</property>
</configuration>


#*******************************apache-hive-2.3.5************************************


#step 1: Go to the HADOOP_INSTALLATION_DIR/share/hadoop/common/lib and check the guava.jar version
#step 2: Now go to HIVE_INSTALLATION_DIR/lib and compare the guava file version of hive with hadoop. If they are not same, delete #the older version among them and copy the newer version in both.
sudo rm guava-19.0.jar from  ~/opt/apache-hive-3.1.1/lib


cd to Desktop
sudo cp guava-27.0-jre.jar ~/opt/apache-hive-3.1.1/lib
sudo cp mysql-connector-java_8.0.19-1ubuntu18.04_all.deb ~/opt/apache-hive-3.1.1/lib


sudo gedit hive-site.xml (apache-hive-3.1.1)

line:3210 - check the bug in this description line keep"locks for transactional"

<name>hive.exec.scratchdir</name>...........change value to:
<value>/tmp/hive-${user.name}</value> 

<name>hive.exec.local.scratchdir</name>.....change value to:
<value>/tmp/${user.name}</value>

<name>hive.scratch.dir.permission</name>....change value to:
<value>733</value>

go back to  the root:
cd 
    Before you run hive for the first time, run
    schematool -initSchema -dbType derby
    If you already ran hive and then tried to initSchema and it's failing:
    mv metastore_db metastore_db.tmp
    Re run
    schematool -initSchema -dbType derby
    Run hive again

cesar@cesar-VirtualBox:~$ schematool -initSchema -dbType derby  (run it)

#https://www.youtube.com/watch?v=fMT1UTkfI8c&t=604s



