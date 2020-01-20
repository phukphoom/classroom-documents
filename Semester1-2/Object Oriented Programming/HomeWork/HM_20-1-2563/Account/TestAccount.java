public class TestAccount {
    public static void main (String[] args){
        Account account1 = new Account(1122,20000);
        account1.setAnnualInterestRate(10);
        account1.withdraw(2500);
        account1.deposite(3000);

        System.out.println("Balance -> " + account1.getBalance());
        System.out.println("Monthly interest - > " + account1.getMonthlyInterest());
        System.out.println("Date created -> " + account1.getDateCreated());
    }
}