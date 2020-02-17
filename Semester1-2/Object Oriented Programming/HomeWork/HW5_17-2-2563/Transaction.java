import java.util.Date;

public class Transaction{
    //Data Field
    private char type;
    private double amount;
    private double balance;
    private String description;

    private Date date = new Date();

    //Constructor
    public Transaction(char type, double amount, double balance, String description){ 
        this.type = type;
        this.amount = amount;
        this.balance = balance;
        this.description = description;
    }

    //Setter

    //Getter

    //Method
    public String toString(){
        return " => type : " + this.type + "\tamount = " + this.amount + "\tbalance = " + this.balance + "\tdescription : " + this.description + "\tdate : " + this.date;
    }
}