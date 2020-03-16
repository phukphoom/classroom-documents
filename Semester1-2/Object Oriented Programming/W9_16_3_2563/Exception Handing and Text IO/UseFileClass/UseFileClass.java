import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class UseFileClass{
    public static void main(String[] args){
        File file = new File("Logfile.txt");
        System.out.println(file.exists());

        writeFile(file);
        readFile(file);
    }

    public static void writeFile(File file){
        try{
            // Compiler will show you with error if not create PrintWriter in try block
            PrintWriter output = new PrintWriter(file);
            output.println("!!Hello World!!");
            output.println("Line : 1");
            output.close();
        }
        catch(FileNotFoundException fileNotFoundException){
            System.out.println(fileNotFoundException);
        }
    }

    public static void readFile(File file){
        try{
            // Compiler will show you with error if not create Scanner in try block
            Scanner input = new Scanner(file);
            ArrayList<String> list = new ArrayList<>();

            while(input.hasNext()){
                list.add(input.nextLine());
            }

            for (String text : list) {
                System.out.println(text);
            }
        }
        catch(FileNotFoundException fileNotFoundException){
            System.out.println(fileNotFoundException);
        }
    }
}