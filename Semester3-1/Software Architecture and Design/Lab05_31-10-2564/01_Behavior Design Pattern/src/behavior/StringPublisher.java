package behavior;

import java.util.ArrayList;
import java.util.concurrent.Flow;

public class StringPublisher implements Flow.Publisher<String>{
    private ArrayList<StringSubscription> stringSubscriptions = new ArrayList();

    public void subscribe(Flow.Subscriber subscriber) {
        StringSubscription stringSubscription = new StringSubscription((StringSubscriber) subscriber);
        stringSubscriptions.add(stringSubscription);

        subscriber.onSubscribe(stringSubscription);
    }

    public void publish(String str){
        for (StringSubscription stringSubscription: stringSubscriptions) {
            stringSubscription.update(str);
        }
    }
}