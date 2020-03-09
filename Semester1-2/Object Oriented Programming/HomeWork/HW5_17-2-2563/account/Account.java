import java.util.Date;
import java.util.ArrayList;

public class Account {
    //Data Field
    private String name;
    private String id;
    private double balance;
    private double annualInterestRate;

    private Date dateCreated =  new Date();
    private ArrayList<Transaction> transaction = new ArrayList<Transaction>();

    //Constructor 
    public Account(){  
    }
    public Account(String name, String id, double balance, double annualInterestRate){ 
        this.id = id;
        this.name = name;
        this.balance = balance;
        this.annualInterestRate = annualInterestRate;
    }

    //Setter
    public void setName (String new_name){
        this.name = new_name;
    }
    public void setId (String new_id){
        this.id = new_id;
    }
    public void setBalance (double new_balance){
        this.balance = new_balance;
    }
    public void setAnnualInterestRate (double new_annualInterestRate){
        this.annualInterestRate = new_annualInterestRate;
    }

    //Getter
    public String getName(){
        return this.name;
    }
    public String getId (){
        return this.id;
    }
    public double getBalance (){
        return this.balance;
    }
    public double getAnnualInterestRate (){
        return this.annualInterestRate;
    }
    public Date getDateCreated (){
        return this.dateCreated;
    }

    //Method
    public String toString(){
        return "{\n\tname = " + this.name + "\n\tid = " + this.id + "\n\tdateCreate = " + this.dateCreated.toString() + "\n\tannualInterestRate = " + this.annualInterestRate + "\n\tbalance = " + this.balance + "\n}";
    }

    public double getMonthlyInterestRate(){
        return (this.getAnnualInterestRate()/100)/12;
    }
    public double getMonthlyInterest(){
        return this.balance * this.getMonthlyInterestRate();
    }

    public void withdraw (double amount){
        this.balance -= amount;
        this.transaction.add(new Transaction('W', amount, this.balance, "Withdraw " + amount));
    }
    public void deposite (double amount){
        this.balance += amount;
        this.transaction.add(new Transaction('D', amount, this.balance, "Deposite " + amount));
    }
    public void showTransactions(){
        if(!this.transaction.isEmpty()){
            for(int i=0;i<this.transaction.size();i++){
                System.out.println(this.transaction.get(i).toString());
            }
        }
    }
}