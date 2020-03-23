import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestBufferIOStream{
    public static void main(String[] args) throws FileNotFoundException,IOException{

        //Transfer data from binaryInput.dat to binaryOutput.dat
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream("binaryInput.dat"));
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream("binaryOutput.dat"));
        System.out.println(">> Start Transfer");
        int transferSize = 0;
        while(bufferedInputStream.available()!=0){
            transferSize++;
            bufferedOutputStream.write(bufferedInputStream.read());
            System.out.println("Trasfered Size -> " + transferSize + " byte");
        }
        bufferedOutputStream.close();
        System.out.println(">> Transfer Completed");
    }
} 