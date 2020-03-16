
public class ReThrowing {
    public static void main(String[] args){
        method1();
    }

    public static void method1(){
        try {
            method2();
        } catch (Exception exception) {
            System.out.println("+++++ >> At method1 msg from method2 " + exception);
        }
    }
    public static void method2() throws Exception{
        try {
            method3();
        } catch (Exception exception) {
            System.out.println("+++++ >> At method2 msg from method3 " + exception);
            throw exception;
        }
    }
    public static void method3() throws Exception{
        throw new Exception("Test ReThrowing");
    }
}