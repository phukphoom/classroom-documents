
public class TestLinearEquation{
    public static void main(String[] args){
       
        LinearEquation equation = new LinearEquation(0,50.2,0,0.55,44.5,5.9);

        if(equation.isSolvable()){
            System.out.println("X is " + equation.getX());
            System.out.println("Y is " + equation.getY());
        }
        else{
            System.out.println("The equation has no solution.");
        }
    } 
}