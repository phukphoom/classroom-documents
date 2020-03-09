class Circle {

    //Data Field
    private double radius;
    private String color;
    static int numberOfObject;

    //Constructor
    public Circle() {
        numberOfObject++;
    }

    public Circle(double radius, String color) {
        this.radius = radius;
        this.color = color;
        numberOfObject++;
    }

    //Setter
    public void setRadius(double new_radius) {
        this.radius = new_radius;
    }

    public void setColor(String new_color) {
        this.color = new_color;
    }

    //Getter
    public double getRadius() {
        return this.radius;
    }

    public String getColor() {
        return this.color;
    }

    public double getArea() {
        return Math.PI * this.radius * this.radius;
    }
}

//Test class
public class TestCircleArray {

    public static void main(String[] args) {
        double totalArea = 0;

        Circle[] circleArray = new Circle[10];
        for (int i = 0; i < 10; i++) {
            circleArray[i] = new Circle();
            circleArray[i].setRadius(Math.random() * 100);

            totalArea += circleArray[i].getArea();
        }
        System.out.println("Total Area = " + totalArea);
    }
}
