package behavior;

import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        StringPublisher stringPublisher = new StringPublisher();

        stringPublisher.subscribe(new AlphabetSubscriber("./output/alphabet.txt"),StringSubscription.SubscriptionType.ALPHABET);
        stringPublisher.subscribe(new NumberSubscriber("./output/number.txt"),StringSubscription.SubscriptionType.NUMBER);
        stringPublisher.subscribe(new SymbolSubscriber("./output/symbol.txt"),StringSubscription.SubscriptionType.SYMBOL);

        Scanner scanner = new Scanner(System.in);

        System.out.println("\nType \"exit\" to end this process.");
        while(true){
            System.out.print("\nYour input : ");
            String str = scanner.nextLine();

            if(!str.equals("exit")){
                stringPublisher.publish(str);
            }
            else{
                break;
            }
        };

        scanner.close();
    }
}