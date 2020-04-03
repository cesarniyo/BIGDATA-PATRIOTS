# CREATE AND UPLOAD

hive> create database enhanceit;
hive> show databases;
hive> use enhanceit;


hive> CREATE EXTERNAL TABLE consultants (id INT,name STRING,email STRING,phone STRING,city STRING,departement_name STRING)
    > COMMENT "Employee details"
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ","
    > LINES TERMINATED BY "\n"
    > STORED AS TEXTFILE;
hive> LOAD DATA LOCAL INPATH '/home/cesar/Desktop/Hive/consultants.csv' OVERWRITE INTO TABLE consultants;
hive> SELECT * FROM consultants;
hive> describe  consultants;




"\t" | "\t" | ","
hive> CREATE EXTERNAL TABLE  department (id INT,name STRING,email STRING,phone INT,departement_name STRING)
    > COMMENT "Employee details"
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY "\t"
    > LINES TERMINATED BY "\n"
    > STORED AS TEXTFILE;

hive> drop table department;
hive> drop database enhanceit;


#CREATE WHILE UPLOADING

hive> CREATE EXTERNAL TABLE department (id INT,depertment_name STRING,consultant_id INT,manager STRING,tech_manager STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.JsonSerDe'
STORED AS TEXTFILE;
load data local inpath "/home/cesar/Desktop/department.json" into table department;
SELECT * FROM department;














