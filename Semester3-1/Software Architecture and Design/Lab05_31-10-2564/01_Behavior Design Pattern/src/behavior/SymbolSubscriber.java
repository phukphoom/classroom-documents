package behavior;

import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.Flow;

public class SymbolSubscriber extends StringSubscriber{
    private String pathToPrint;

    public SymbolSubscriber(String pathToPrint){
        this.pathToPrint = pathToPrint;
    }

    private String filterSymbol(String str){
        return str.replaceAll("[a-zA-Z]|[0-9]|[\s]","");
    }

    public void onSubscribe(Flow.Subscription subscription) {
        super.stringSubscription = (StringSubscription) subscription;

        System.out.println("SymbolSubscriber: Subscribed");
    }

    public void onNext(String item) {
        if(item!=null){
            System.out.println("SymbolSubscriber: Received \"" + item + "\"");
            try{
                FileWriter writer = new FileWriter(this.pathToPrint,true);
                String stringFiltered = this.filterSymbol(item);

                writer.write(stringFiltered);
                writer.close();

                System.out.println("SymbolSubscriber: Write \"" + stringFiltered + "\" to " + this.pathToPrint);
            }
            catch (IOException error){
                System.out.println("SymbolSubscriber: " + error);
            }
        }
        else{
            System.out.println("SymbolSubscriber: Received null item");
        }
    }

}