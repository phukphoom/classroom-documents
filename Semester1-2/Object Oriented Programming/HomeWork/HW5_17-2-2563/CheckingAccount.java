public class CheckingAccount extends Account{
    //Constructor
    public CheckingAccount(String name, String id, double balance){
        super(name, id, balance, 0);
    }
    
    //Method
    public void withdraw (double amount){
        if(this.getBalance()>=amount+20){
            super.withdraw(amount+20);
        }
        else{
            System.out.println(" => !! Not enough money !!");
        }
    }

    public void deposite (double amount){
        if(this.getBalance()+amount>=20){
            super.deposite(amount-20);
        }
        else{
            System.out.println(" => !! Not enough money !!");
        }
    }

}