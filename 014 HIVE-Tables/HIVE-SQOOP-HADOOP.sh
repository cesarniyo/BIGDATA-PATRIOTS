hive> create database bigdata;
hive> show databases;
hive> use bigdata;


hive> CREATE EXTERNAL TABLE hive_table (id INT,item_number INT,rating INT,reviews INT)
    > COMMENT "Product details"
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY "\t"
    > LINES TERMINATED BY "\n"
    > STORED AS TEXTFILE;
hive> LOAD DATA LOCAL INPATH '/home/cesar/Desktop/u.data.csv' OVERWRITE INTO TABLE hive_table;
hive> SELECT * FROM hive_table limit 5;
hive> describe  hive_table;

hdfs dfs -ls /user/hive/warehouse
hdfs dfs -cat /user/hive/warehouse


sqoop import --connect jdbc:mysql://localhost/bigdata --username cesar -P --table hive_table --hive-import --hive-database test_root --hive-table posts1 --hive-drop-import-delims --null-string '\\N' --null-non-string '\\N' --target-dir test_hive_root/2
