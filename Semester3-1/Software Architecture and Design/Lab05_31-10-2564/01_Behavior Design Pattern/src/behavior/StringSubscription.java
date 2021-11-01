package behavior;

import java.util.concurrent.Flow;

public class StringSubscription implements Flow.Subscription{
    public enum SubscriptionType {
        ALPHABET, NUMBER, SYMBOL
    }

    private StringSubscriber subscriber;
    private SubscriptionType subscriptionType;

    public StringSubscription(StringSubscriber subscriber, SubscriptionType subscriptionType) {
        this.subscriber = subscriber;
        this.subscriptionType = subscriptionType;
    }

    public void request(long n) {
    }

    public void cancel() {
    }

    public void update(String str){
        this.subscriber.onNext(str);
    }

    public SubscriptionType getSubscriptionType(){
        return this.subscriptionType;
    }
}