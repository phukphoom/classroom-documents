package behavior;

import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.Flow;

public class NumberSubscriber extends StringSubscriber{
    private String pathToPrint;

    public NumberSubscriber(String pathToPrint){
        this.pathToPrint = pathToPrint;
    }

    public void onSubscribe(Flow.Subscription subscription) {
        super.subscription = (StringSubscription) subscription;

        System.out.println("NumberSubscriber: Subscribed");
    }

    public void onNext(String item) {
        if(item!=null){
            System.out.println("NumberSubscriber: Received \"" + item + "\"");
            try{
                FileWriter writer = new FileWriter(this.pathToPrint,true);
                writer.write(item);
                writer.close();

                System.out.println("NumberSubscriber: Write \"" + item + "\" to " + this.pathToPrint);
            }
            catch (IOException error){
                System.out.println("NumberSubscriber: " + error);
            }
        }
        else{
            System.out.println("NumberSubscriber: Received null");
        }
    }
}