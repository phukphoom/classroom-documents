package behavior;

import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.Flow;

public class AlphabetSubscriber extends StringSubscriber{
    private String pathToPrint;

    public AlphabetSubscriber(String pathToPrint){
        this.pathToPrint = pathToPrint;
    }

    public void onSubscribe(Flow.Subscription subscription) {
        super.subscription = (StringSubscription) subscription;

        System.out.println("AlphabetSubscriber: Subscribed");
    }

    public void onNext(String item) {
        if(item!=null){
            System.out.println("AlphabetSubscriber: Received \"" + item + "\"");
            try{
                FileWriter writer = new FileWriter(this.pathToPrint,true);
                writer.write(item);
                writer.close();

                System.out.println("AlphabetSubscriber: Write \"" + item + "\" to " + this.pathToPrint);
            }
            catch (IOException error){
                System.out.println("AlphabetSubscriber: " + error);
            }
        }
        else{
            System.out.println("AlphabetSubscriber: Received null");
        }
    }
}