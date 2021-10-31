package behavior;

import java.util.concurrent.Flow;

public abstract class StringSubscriber implements Flow.Subscriber<String>{
    protected StringSubscription stringSubscription;

    public abstract void onSubscribe(Flow.Subscription subscription);

    public abstract void onNext(String item);

    public void onError(Throwable throwable) {
        System.out.println("StringSubscriber: " + throwable);
    }

    public void onComplete() {
        System.out.println("StringSubscriber: Completed");
    }
}