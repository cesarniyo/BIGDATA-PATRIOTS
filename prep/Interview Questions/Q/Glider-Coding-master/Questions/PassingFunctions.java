"""
Complete the following class with appropriate options

(There are multiple drop-downs in the below code, please select a correct response for each drop-down)
"""

public class PassingFunctions {
    public static void main(String[] args) {
        SparkConf conf = new SparkConf().setAppName("Big Apple").setMaster("local");

        JavaSparkContext sc = new JavaSparkContext(conf);

        class GetLength implements Function<String, Integer>{
            public Integer call (String s){ // 'call' may not be the correct choice
                return s.length();
            }
        }

        class Sum implements Function2<Integer, Integer, Integer>{
            public Integer call (Integer a, Integer b){
            return a + b;
            }
        }

        JavaRDD<String> lines = sc.textFile("src/main/resources/compressed.gz");

        JavaRDD<Integer> lineLengths = lines.map(new GetLength()); // 'map' may not be correct choice

        lineLengths.foreach(x -> System.out.println(x));

        int totalLength = lineLengths.reduce(new Sum());

        System.out.println(totalLength);
    }
}