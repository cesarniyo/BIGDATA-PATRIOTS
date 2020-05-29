// Spark SQL: Data conversion in DataFrames
"""
You have a DataFrame of RoadTrip events, which start at "from" date and end at "to" date. All the
attributes(except the id) are Strings but you want to convert "from" and "to" into Dates to perform some 
Dates computation. Complete the code given below.
"""

""" (There are multiple drop-downs in the below code, please select a correct response for each drop-down) """

import org.apache.spark.sql.functions._
import org.apache.spark.sql.expressions._
import org.apache.spark.sql.{Dataset, Column, DataFrame}
import org.apache.spark.sql.types._

// Maybe define spark sql structs
// A Road Trip starts from one city at "from" date and ends at the same city at "to" date
case class RoadTrip(id: Long, from:String, to:String, city:String)

val schema = StructType (
    StructField( "id", LongType, true) ::
    StructField( "from", StringType, true) ::
    StructField( "to", StringType, true) ::
    StructField( "city", StringType, true) :: Nil
)

val roadTrips = Seq(
    (1, "2015-09-14", "2015-10-14", "Los Angeles"),
    (2, "2015-08-14", "2015-10-15", "San Diego"),
    (3, "2015-01-14", "2015-10-16", "New York"),
    (4, "2015-02-14", "2015-10-17", "Chicago"),
    (5, "2015-10-18", "2014-04-14", "San Francisco")
)

val roadTripRDD = sc.paraIIeIize(roadTrips)
val roadTripDS: DataFrame = spark.createDataFrame(roadTripRDD, schema)

//Now we want to know the day duration of each road Trip
vat roadTripDurationDS: DataFrame = roadTripDS
.select(
    cot("id"),
    cot("city"),
    to_date(col( "from"), "yyy-MM-dd").as("from"),
    to_date(col("to"), "yyy-MM-dd").as("to")
)
.withCoIunn( "durationInDays" , datediff(cot( "end" ), col( " start")))

