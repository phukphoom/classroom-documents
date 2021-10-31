package behavior;

import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.Flow;

public class NumberSubscriber extends StringSubscriber{
    private String pathToPrint;

    public NumberSubscriber(String pathToPrint){
        this.pathToPrint = pathToPrint;
    }

    private String filterNumber(String str){
        return str.replaceAll("[^0-9]","");
    }

    public void onSubscribe(Flow.Subscription subscription) {
        super.stringSubscription = (StringSubscription) subscription;

        System.out.println("NumberSubscriber: Subscribed");
    }

    public void onNext(String item) {
        if(item!=null){
            System.out.println("NumberSubscriber: Received \"" + item + "\"");
            try{
                FileWriter writer = new FileWriter(this.pathToPrint,true);
                String stringFiltered = this.filterNumber(item);

                writer.write(stringFiltered);
                writer.close();

                System.out.println("NumberSubscriber: Write \"" + stringFiltered + "\" to " + this.pathToPrint);
            }
            catch (IOException error){
                System.out.println("NumberSubscriber: " + error);
            }
        }
        else{
            System.out.println("NumberSubscriber: Received null item");
        }
    }
}