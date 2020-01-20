class Circle {
    //Data field
    static int numberOfObject;
    double radius = 1.0;
    String color = "Black";
    boolean isFilled = false;
   
    //Constructor
    Circle(){
        numberOfObject++;
    }
    Circle(int radius, String color, boolean fill){
        numberOfObject++;
        this.radius = radius;
        this.color = color;
        this.isFilled = fill;
    }

    //Method
    double getArea(){
        return Math.PI * this.radius * this.radius;
    }
}


//creat class for test class circle
public class TestCircle {
    public static void main(String[] args){

        Circle circle1 = new Circle();
        System.out.println("-----------------------------------------");
        System.out.println("Number of Object -> " + Circle.numberOfObject);
        System.out.println("radius = " + circle1.radius);
        System.out.println("color = " + circle1.color);
        System.out.println("filled = " + circle1.isFilled);
        System.out.println("area = " + circle1.getArea());


        Circle circle2 = new Circle(50,"Red",true);
        System.out.println("-----------------------------------------");
        System.out.println("Number of Object -> " + Circle.numberOfObject);
        System.out.println("radius = " + circle2.radius);
        System.out.println("color = " + circle2.color);
        System.out.println("filled = " + circle2.isFilled);
        System.out.println("area = " + circle2.getArea());
    }
}