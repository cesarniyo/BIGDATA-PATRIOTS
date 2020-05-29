""" (There are multiple drop-downs in the below code, please select a correct response for each drop-down)"""

import org.apache.commons.lang.StringUtils;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.apt.java.JavaDoubleRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.apt.java.function.DoubleFunction;

public class MapToDouble {
    public static void main(String[] args) throws Exception {
        String master;
        if (args.length > O) {
            master = args[0];
        ) else {
            master = "local";

        JavaSparkContext sc = new JavaSparkContext(
            master, "maptodouble", System.getenv("SPARK_HOME"), System.getenv("JARS"));

        JavaRDD<Integer> rdd = sc.parallelize(Arrays.asList(1, 2, 3, 4));

        JavaDoubIeRDD result = rdd.mapToDouble (
            new DoubleFunction<Integer>{
                public double execute (Integer x) {
                    double y = (double) x;
                    return y * y;
                }
            }
        );

        System.out.println(StringUtils.join(result.collect(), ",")
    }
}
