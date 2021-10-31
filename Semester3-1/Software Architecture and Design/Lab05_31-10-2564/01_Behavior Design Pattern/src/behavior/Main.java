package behavior;

import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        StringPublisher stringPublisher = new StringPublisher();

        stringPublisher.subscribe(new AlphabetSubscriber("./output/alphabet.txt"));
        stringPublisher.subscribe(new NumberSubscriber("./output/number.txt"));
        stringPublisher.subscribe(new SymbolSubscriber("./output/symbol.txt"));

        Scanner scanner = new Scanner(System.in);

        System.out.println("\nType \"exit\" to end this process.");
        while(true){
            System.out.print("\nYou input : ");
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