public class SavingAccount extends Account{
    //Constructor
    public SavingAccount(String name, String id, double balance, double annualInterestRate){
        super(name, id, balance, annualInterestRate);
    }
    
    //Method
    public void withdraw (double amount){
        if(this.getBalance()>=amount){
            super.withdraw(amount);
        }
        else{
            System.out.println(" => !! Not enough money !!");
        }
    }
}