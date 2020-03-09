import java.util.Date;

public class Circle extends GeoMetric{
    //Data Field
    private double radius;

    //Constructor
    public Circle(){
        //super() is defalut call.
        System.out.println("LOG => Circle constructor is involked");
    }
    public Circle(double radius){
        //super() is defalut call.
        this.radius = radius;
    }
    public Circle(double radius, String color, boolean isFilled, Date dateCreated){
        super(color, isFilled, dateCreated); //super() isn't call, if we implement super(args)
        this.radius = radius;
    }

    //Setter
    public void setRadius(double new_radius){
        this.radius = new_radius;
    }

    //Getter
    public double getRadius(){
        return this.radius;
    }

    //Method
    public String printCircle(){
        return "{ radius = " + this.radius + " " + super.toString() + " }";
    }
}