import java.util.Date;

public class Account {
    //Data Field
    private int id;
    private double balance;
    private double annualInterestRate = 0;
    private Date dateCreated;

    //Constructor 
    public Account(){  
        this.dateCreated = new Date();
    }
    public Account(int id, double balance){ 
        this.dateCreated = new Date();
        this.id = id;
        this.balance = balance;
    }

    //Mutator
    public void setId (int id){
        this.id = id;
    }
    public void setBalance (double balance){
        this.balance = balance;
    }
    public void setAnnualInterestRate (double annualInterestRate){
        this.annualInterestRate = annualInterestRate;
    }

    //Accessor
    public int getId (){
        return this.id;
    }
    public double getBalance (){
        return this.balance;
    }
    public double getAnnualInterestRate (){
        return this.annualInterestRate / 100;
    }
    public Date getDateCreated (){
        return this.dateCreated;
    }

    //Method
    public double getMonthlyInterestRate(){
        return this.getAnnualInterestRate() / 12;
    }
    public double getMonthlyInterest(){
        return this.balance * this.getMonthlyInterestRate();
    }
    public void withdraw (double value){
        this.balance -= value;
    }
    public void deposite (double value){
        this.balance += value;
    }
}

