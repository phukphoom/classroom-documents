public class PriviledgedAccount extends Account{
    //Data Field
    private double widthdrawLimit = -10000;

    //Constructor
    public PriviledgedAccount(String name, String id, double balance, double annualInterestRate){
        super(name, id, balance, annualInterestRate);
    }

    //Method
    public void withdraw (double amount){
        if(this.getBalance()-amount>=this.widthdrawLimit){
            super.withdraw(amount);
            
        }
        else{
            System.out.println(" => !! Not enough money !! => The maximum withdrawal amount is " + (this.getBalance() - this.widthdrawLimit));
        }
    }
}