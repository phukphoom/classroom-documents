import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestFileIOStream{
    public static void main(String[] args) throws FileNotFoundException,IOException{
        //Writing Data to binary File
        FileOutputStream fileOutputStream = new FileOutputStream("binary.dat");
        System.out.println(">> Start Writing File");
        for(int i=0;i<10;i++){
            fileOutputStream.write(i);
        }
        System.out.println(">> Finish Writing File");
        fileOutputStream.close();

        //Reading Data in binary File
        System.out.println(">> Start Reading File");
        FileInputStream fileInputStream = new FileInputStream("./binary.dat");
        while(fileInputStream.available()!=0){
            System.out.println(fileInputStream.read());
        }
        System.out.println(">> Finish Reading File");
        fileInputStream.close();
    }
} 