import scala.io.Codec.string2codec
import scala.io.Source
import scala.reflect.io.File



object WordCounter {
  //val SrcDestination: String = ".." + File.separator + "shakespeare.txt"
  val Word = "\\b([A-Za-z\\-])+\\b".r

  def main(args: Array[String]): Unit = {

    val counter = scala.io.Source.fromFile("shakespeare.txt")
      .getLines
      .flatMap(_.split("\\W+"))
      .foldLeft(Map.empty[String, Int]){
        (count, word) => count + (word -> (count.getOrElse(word, 0) + 1))

          println(word)
      }
  }

}
