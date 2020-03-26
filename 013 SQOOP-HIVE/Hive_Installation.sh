# HIVE INSTALLATION

## go to opt
cd opt

##GO TO YOUR FOLDER (opt) THEN DOWNLOAD HIVE FROM THE LINK BELLOW:
sudo wget https://archive.apache.org/dist/hive/hive-2.3.5/apache-hive-2.3.5-bin.tar.gz

##UNTAR THE DOWNLOADED FOLDER
sudo tar -xzf apache-hive-2.3.5-bin.tar.gz #

mv apache-hive-2.3.5-bin apache-hive-2.3.5

## back to the root
cd


## UPDATE THE BASH PROFILE
sudo gedit .bash_profile
## SET UP SCOOP PATH ON THE BASH FILE
export HIVE_HOME=/home/cesar/opt/apache-hive-2.3.5
export PATH=$PATH:$HIVE_HOME/bin
sudo source .bash_profile

jps
hdfs dfs -ls /
hdfs dfs -mkdir /user
hdfs dfs -mkdir /temp
hdfs dfs -mkdir /user/hive/warehouse

hdfs dfs -ls /


hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -chmod g+w /temp


# new tab : to to .bash_profile (leave it there)

cd opt/apache-hive-2.3.5/
opt/apache-hive-2.3.5/ls     in hive directory
cd /apache-hive-2.3.5 mkdir hive
ls
cd hive  do pwd


# open new tab
cd /apache-hive-2.3.5/conf/ls
cd /apache-hive-2.3.5/conf/ cp hive-env.sh.template hive-env.sh
d /apache-hive-2.3.5/conf/ sudo gedit hive-env.sh
export HADOOP_HEAPSIZE=512
export HADOOP_HOME==/home/cesar/opt/hadoop-3.1.3
export HIVE_CONF_DIR=/home/cesar/opt/apache-hive-2.3.5/conf


save.....
cd /apache-hive-2.3.5/conf
sudo gedit hive-site.xml    (copy the properties form github)

<configuration>
<property>
<name>javax.jdo.option.ConnectionURL</name>
<value>jdbc:derby:;databaseName=/home/cesar/opt/apache-hive-2.3.5/hive/metastore_db;create=true</value>
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





go back to  
cd /apache-hive-2.3.5/hive copy the properties

cesar@cesar-VirtualBox:~/opt/apache-2.3.5/bin$ schematool -initSchema -dbType derby  (run it)





















