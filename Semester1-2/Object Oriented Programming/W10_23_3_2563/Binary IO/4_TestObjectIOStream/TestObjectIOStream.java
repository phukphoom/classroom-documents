import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class TestObjectIOStream{
    public static void main(String[] args) throws FileNotFoundException,IOException,ClassNotFoundException{
        //Writing Object to binary File
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(new FileOutputStream("binary.dat"));
        System.out.println(">> Start Wrinting File");
        objectOutputStream.writeObject(new Circle(5));
        objectOutputStream.close();
        System.out.println(">> Finish Wrinting File");

        //Reading Object to binary File
        ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream("binary.dat"));
        System.out.println(">> Start Reading File");
        System.out.println("Object : " + objectInputStream.readObject());
        System.out.println(">> Finish Reading File");
    }
} 

//Implement Serializable interface for work with ObjectIOStream 
class Circle implements Serializable{
    double radius;
    static int numberOfObject;
    
    Circle (double radius){
        this.radius = radius;
        numberOfObject++;
    }
}