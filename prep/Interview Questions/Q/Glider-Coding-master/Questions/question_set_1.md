## Question 1: 
    Please introduce yourself adn provide a brief summary of your professional strengths.
    (Think time: 30 Sec | Recording Time : 1 min)

#### Answer :
    Elevator speech with added technical and soft skill strength.


## Question 2:
    If your RDD (resilient distributed dataset) is so large that all of its elements will not fit in the memory 
    on the drive machine, then which of the following is NOT recommended and would cause 
    performance and memory issues?

#### Answer :
    Collect()
    
    
## Question 3:
    For an 8 core executor with a 1 5-second micro-batch duration, for 100 rules, spark.default.parallelism = 50 
    and the number of stages per task = 3. What would be the average task time?

#### Answer :
    394 ms
    
    
## Question 4:
    Which of the following options does not take the collections aggregateKey and reduceByKey, and 
    throws an error? 

#### Answer :
    val pairs = pairs.reduceByKey(new HashSet[Int])(_ + _)
    

    
## Question 5:
    Which of the following is not the correct way to perform concatenation of two columns of a data 
    frame, in Spark?

#### Answer :
    val dfResults = dfSource.select(concat( ",", dfSource.columns.map(col(c)):_*))

## Question 6:
    In Spark, RDD storage level is defined as MEMORY_ONLY_2. What does _2 mean?

#### Answer :
    replicas
    

## Question 7:
    When a Spark action is triggered, which one of the following configurations decides the maximum 
    number of output files?

#### Answer :
    spark.sql.shuffle.partitions
    
    
## Question 8:
    What does the following code print? 
    val animals = List("lion", "tiger") 
    val birds = List("pigeon", "peacock") 
    vat animalsRdd = sc.parallelize(animals) 
    val birdsRdd = sc.parallelize(birds)  
    val both = animals.union(birds)
    println(both) 
    
#### Answer:    
    List(lion, tiger, pigeon, peacock)
    
    
## Question 9:
    What does the following code print?
    val fruitsRdd = sc.parallelize(List(apple, mango))
    val vegetablesRdd = sc.parallelize(List("carrot", "beetroot"))
    val zippedPairsRdd = fruitsRdd. zip(vegetablesRdd)
    zippedPairsRdd.collect().foreach(println)
    
#### Answer :
    (apple, carrot)
    (mango, beetroot)
    
        
## Question 10:
    What does the following code print?
    val names = List ("john", "alex", "adam")
    val namesRdd = sc.parallelize(names)
    val somenamesRdd = namesRdd.filter { (l: String) =>
        l.take(l) != "a"
    }
    somenamesRdd.collect().foreach(println)

#### Answer :
    john
    
    
## Question 11:
    What does the following code print?
    val numbersRdd = sc.parallelize(List(8, 60, 6, 558, 691, 9, 700)) 
    val numbers = numbersRdd.takeOrdered(3) 
    println(numbers.toList)

#### Answer :
    List(6, 8, 9)
    
        
## Question 12:
    see MongoCreate.java

#### Answer :
    To Be Updated
    To Be Updated
    hasNext
    
        
## Question 13: 
    Topic: AWS
    When you are uploading a file of 10 GB into an AWS S3 bucket without giving the chunk size, it either gets uploaded in a 
    single chunk and a single key is returned or it gets uploaded in multiple chunks and multiple keys are returned. Where would 
    you configure whether a file should be uploaded in a single chunk or in multiple chunks?

#### Answer :
    Object Gateway
    
    
## Question 14:
    Topic: AWS
    Your company has asked you to capture and forwared a real-time data stream on a massive scale, directly to RedShift for 
    analysis with BI tools. Which AWS tool is the most appropriate one that can provide this feature set and is cost-effective?

#### Answer :
    Kinesis Firehose
    
        
## Question 15:
    Topic: AWS
    Part A:
        Which of the following AWS EC2 instances support decimal values?
    Answer :
        Xen-based instance
    Part B:
        Which of the following instances are based on the Nitro System?
    Answer :
        R5a, i3.metal
    Part C:
        Which of the following AWS command is used to enable detailed monitoring of specified instances?
    Answer :
        monitor-instances

    
## Question 16:
    What will be the output of the following operations on Spark data frame?
    val test = sqlContext.read.json(sc.parallelize(Seq("""{"a":1, "b":[2,3]}""")))
    test.withColumn("b", explode($"b")).show 
    
#### Answer :
    +----+----+
    |   a|   b|
    +----+----+
    |   1|   2|
    |   1|   3|
    +----+----+
    
    
## Question 17:
    The below query can be replaced by which of the following queries?
    1. SELECT   name
    2. FROM     instructor
    3. WHERE    salary <= 100000
                AND salary >= 90000;
    
#### Answer :
    1. SELECT   name
    2. FROM     instructor
    3. WHERE    salary BETWEEN 90000 AND 100000;
        
        
## Question 18:
    Consider a table TAB1 with the following two columns:
    COL1 INT,
    COL2 INT
    Which of the following SQL(s) will run successfully?
    
#### Answers (2) :
    ALTER TABLE TAB1
        ADD COL3 AS (COL1*COL2) INT;
    
    ALTER TABLE TAB1
        ADD COL4 INT DEFAULT 10;
        
    
## Question 19:
    A user creates a table using the below SQLL:
    CREATE TABLE MY_DATA (COL_A int, COL_B int, COL_C int, COL_D int);
    
    And then executes the below SQL to insert data into this table.
    1. INSERT INTO MY_DATA(COL_B, COL_C, COL_D, COL_A)
    2. values (1,2,3,4);
    
    What will be inserted into COL_A?
    
#### Answer :
    4
    
    
## Question 20:
    A user executes the following SQL:
    SELECT POSITION ( 'My' IN 'My Table' ) as StringPosition;
    
    What will be the output of the above query?
    
#### Answer :
    1
    
        
## Question 21:
    Select the correct option for the below query.
    SELECT name
    FROM instructor
    WHERE salary IS NOT NULL;
    
#### Answer :
    Tuples with any salary
    
        
## Question 22:
    Consider the following set of tables of SQL(s) executed by a user.
    `CREATE TABLE MY_DATA (COL_A INT, COL_B INT, COL_C INT, COL_D INT);
    INSERT INTO MY_DATA(1,2,3,4);
    
    CREATE TABLE MY_DATA_LKP (COL_Z INT)
    INSERT INTO MY_DATA_LKP(1);`
    
    
#### Answer :
    
    
            
## Question :
    
    
#### Answer :
    
    
            
## Question :
    
    
#### Answer :
    
    
            
## Question :
    
    
#### Answer :
    
    
            
## Question :
    
    
#### Answer :
    
    
            
## Question :
    
    
#### Answer :
    
    
    
## Question 16:
    Coding Question - See CountCoutries directory 

    