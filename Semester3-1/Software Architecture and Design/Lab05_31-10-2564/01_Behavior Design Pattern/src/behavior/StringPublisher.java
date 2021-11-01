package behavior;

import java.util.ArrayList;
import java.util.concurrent.Flow;

public class StringPublisher implements Flow.Publisher<String>{
    private final ArrayList<StringSubscription> subscriptions = new ArrayList<>();

    public void subscribe(Flow.Subscriber subscriber) {
        this.subscribe(subscriber, null);
    }

    public void subscribe(Flow.Subscriber<String> subscriber, StringSubscription.SubscriptionType type) {
        StringSubscription subscription = new StringSubscription((StringSubscriber) subscriber, type);
        this.subscriptions.add(subscription);

        subscriber.onSubscribe(subscription);
    }

    public void publish(String str){
        for (StringSubscription subscription: this.subscriptions) {

            String filteredString;
            switch (subscription.getSubscriptionType()){
                case ALPHABET -> {
                    filteredString = str.replaceAll("[^a-zA-Z]","");
                }
                case NUMBER -> {
                    filteredString = str.replaceAll("[^0-9]","");
                }
                case SYMBOL -> {
                    filteredString = str.replaceAll("[a-zA-Z]|[0-9]|[\s]","");
                }
                default -> {
                    filteredString = "";
                }
            }

            if(!filteredString.equals("")){
                subscription.update(filteredString);
            }
        }
    }
}