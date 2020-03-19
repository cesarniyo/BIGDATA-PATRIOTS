import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class WordCount {

    public static void main(String[] args) throws IOException {
        //Create input
        FileInputStream fin = new FileInputStream("shakespeare.txt");
        Scanner fileInput = new Scanner(fin);

        //Create the arraylist
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> count = new ArrayList<Integer>();

        while (fileInput.hasNext()) {
            String nextWord = fileInput.next().toLowerCase().replaceAll("[^a-zA-Z ]","");

            if (words.contains(nextWord)) {
                int index = words.indexOf(nextWord);
                count.set(index, count.get(index) + 1);
            } else {
                words.add(nextWord);
                count.add(1);
            }

        }
        //Close
        fileInput.close();
        fin.close();

        //Print out the results
        for (int i = 0; i < words.size(); i++) {
            System.out.println(words.get(i) + ":" + count.get(i));
        }
    }
}
