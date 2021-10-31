package behavior;

import java.util.concurrent.Flow;

public class StringSubscription implements Flow.Subscription{
    private StringSubscriber stringSubscriber;

    public StringSubscription(StringSubscriber stringSubscriber) {
        this.stringSubscriber = stringSubscriber;
    }

    public void request(long n) {
    }

    public void cancel() {
    }

    public void update(String str){
        this.stringSubscriber.onNext(str);
    }
}