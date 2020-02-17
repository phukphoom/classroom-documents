public class TestProgram{
    public static void main(String[] args){
        System.out.println("======================================================================================================================================\n");
        SavingAccount savingAccount = new SavingAccount("Saving", "1122", 1000 ,1.5);
        System.out.println(savingAccount.toString() + "\n");
        savingAccount.withdraw(1100);
        savingAccount.withdraw(100);
        savingAccount.deposite(100);
        savingAccount.deposite(2000);
        savingAccount.showTransactions();
        System.out.println("\n======================================================================================================================================");
        
        System.out.println("======================================================================================================================================\n");
        CheckingAccount checkingAccount = new CheckingAccount("checking", "1133", 1000);
        System.out.println(checkingAccount.toString() + "\n");
        checkingAccount.withdraw(1100);
        checkingAccount.withdraw(100);
        checkingAccount.deposite(100);
        checkingAccount.deposite(2000);
        checkingAccount.showTransactions();
        System.out.println("\n======================================================================================================================================");

        System.out.println("======================================================================================================================================\n");
        PriviledgedAccount priviledgedAccount = new PriviledgedAccount("Priviled", "1144", 1000 ,1.5);
        System.out.println(priviledgedAccount.toString() + "\n");
        priviledgedAccount.withdraw(200000);
        priviledgedAccount.withdraw(1100);
        priviledgedAccount.withdraw(100);
        priviledgedAccount.deposite(100);
        priviledgedAccount.deposite(2000);
        priviledgedAccount.showTransactions();
        System.out.println("\n======================================================================================================================================");
    }

}