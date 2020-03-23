import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestDataIOStream{
    public static void main(String[] args) throws FileNotFoundException,IOException{

        //Writing Data to binary File with Type
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream("binary.dat"));
        System.out.println(">> Start Wrinting File : File Size => " + dataOutputStream.size());
        dataOutputStream.writeUTF("Hello Data");
        dataOutputStream.writeInt(120);
        dataOutputStream.writeDouble(15.50);
        dataOutputStream.writeChar('K');
        System.out.println(">> Finish Wrinting File : File Size => " + dataOutputStream.size());
        dataOutputStream.close();

        //Reading Data in binary File with Type
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream("binary.dat"));
        System.out.println(">> Start Reading File : Avalaible Size => " + dataInputStream.available());
        System.out.println("String : " + dataInputStream.readUTF());
        System.out.println("Int : " + dataInputStream.readInt());
        System.out.println("Double : " + dataInputStream.readDouble());
        System.out.println("Char: " + dataInputStream.readChar());
        System.out.println(">> Finish Reading File : Available Size => " + dataInputStream.available());
        dataInputStream.close();
    }
} 