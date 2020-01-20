package Shape;

public class Circle {
    //Data field
    private double radius = 1.0;

    //Constructor
    public Circle(){
    }

    //Mutator
    public void setRadius (double newRadius) {
        this.radius = newRadius;
    }
    //Accessor
    public double getRadius () {
        return this.radius;
    }
}