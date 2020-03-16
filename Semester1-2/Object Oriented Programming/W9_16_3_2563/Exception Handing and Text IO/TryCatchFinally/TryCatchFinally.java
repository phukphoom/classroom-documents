public class TryCatchFinally{
    public static void main(String[] args){
        try{
            int a = 0;
            int b = 0;
            int result = divide(a,b);
            System.out.println("result " + a + " / " + b + " = " + result);
        }
        catch(ArithmeticException exception){
            System.out.println("+++++ >> " + exception);
        }
        // Can catch Multi Exceptions in once time
        finally{
            System.out.println("+++++ >> End Program");
        }
    }

    // Can throw Multi Exceptions in once time
    public static int divide(int a, int b) throws ArithmeticException{
        if(b==0){
            throw new ArithmeticException("( Method divide ) [ Divider is Zero ]");
        }

        return a/b;
    }
}