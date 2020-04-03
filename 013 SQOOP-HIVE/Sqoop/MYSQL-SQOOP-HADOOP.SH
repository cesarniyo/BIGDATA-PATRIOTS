RDBS

#UPDATING FILES,INSTALLING MYSQL DATABASE SYSTEM
$ sudo apt update
$ sudo apt install mysql-server
$ sudo mysql_secure_installation
$ systemctl status mysql.service

#STARTING THE SYSTEM
$ systemctl start mysql
$ systemctl stop mysql

#STARTING AND DIVING INTO THE SYSTEM WITH SUDO
$ systemctl start mysql
$ sudo mysql

#SHOW IF ANY DATABASE CREATED, CREATE ONE
mysql> show databases;
mysql> create database bigdata;

#INSIDE bigdata chech if any table created before
mysql> show databases;
mysql> use bigdata;
mysql> show tables;

#CREATE A TABLE AND INSTERT VALUES
mysql> create table engineers(id INT(10) NOT NULL PRIMARY KEY, name VARCHAR(20));
mysql> describe engineers;
mysql> insert into engineers (id,name) value(1, 'Aashish');
mysql> insert into engineers (id,name) value(3, 'Rahib'),(4,'Tom');
mysql> select * from engineers;

mysql> exit
mysql> DROP TABLE table-name;


#UPLOADING A FILE TO THE TABLE
create table userdata (id INT(10),item_number INT(20),rating INT(10),reviews INT(100));
mysql> LOAD DATA LOCAL INFILE '/home/cesar/Desktop/u.data.txt' INTO TABLE userdata;
mysql> select * userdata;





mysql> SET GLOBAL validate_password_policy=LOW;
mysql> --user=cesar
mysql> CREATE USER cesar@localhost IDENTIFIED BY 'Password';
GRANT ALL PRIVILEGES ON *.* TO 'cesar'@'localhost';
mysql> GRANT ALL PRIVILEGES ON bigdata.* to cesar@localhost ;
mysql> GRANT ALL PRIVILEGES ON engineers to cesar@localhost;
mysql> GRANT ALL PRIVILEGES ON userdata to cesar@localhost;
mysql> FLUSH PRIVILEGES;
mysql> SHOW GRANTS FOR 'cesar'@'localhost';

#**************************************************************************************************************

##IMPORTING DATA FROM MYSQL TO HADOOP

*download mysql-connector-java-8.0.18.jar save it to sqoop lib
*mysql> SET GLOBAL time_zone = '-5:00';


$ sqoop import  --connect jdbc:mysql://localhost/bigdata --username cesar --password "Password" --table engineers --target-dir hdfs://localhost:9000/FROM-MYSQ49 -m 1


EXPORTING DATA FROM HADOOP TO MYSQL

hdfs dfs -mkdir /TO-MYSQL
hdfs dfs -put /home/cesar/Desktop/u.data /TO-MYSQL
hdfs dfs  -cat /TO-MYSQL/u.data.txt

##EXPORTING DATA FROM HADOOP TO MYSQL

##CREATE A TABLE into mysql with fields matching the ones on the file 
$ systemctl start mysql
$ sudo mysql

mysql> create table userdata(id INT(10), item_umber INT(10), rating INT(10), review INT(100));
mysql> describe userdata;

Now do:
sqoop export  --connect jdbc:mysql://localhost/bigdata --username cesar --password "Password" --table engineersBack  --export-dir hdfs://localhost:9000/FROM-MYSQ49/part-m-00000 -m 1





