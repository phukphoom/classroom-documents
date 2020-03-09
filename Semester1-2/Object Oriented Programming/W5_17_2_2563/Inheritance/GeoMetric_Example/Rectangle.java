import java.util.Date;

public class Rectangle extends GeoMetric{
    //Data Field
    private double width;
    private double height;

    //Constructor
    public Rectangle(){
        //super() is defalut call.
        System.out.println("LOG => Rectangle constructor is involked");
    }
    public Rectangle(double width, double height){
        //super() is defalut call. 
        this.width = width;
        this.height = height;
    }
    public Rectangle(double width, double height, String color, boolean isFilled, Date dateCreated){
        super(color, isFilled, dateCreated); //super() isn't call, if we implement super(args)
        this.width = width;
        this.height = height;
    }

    //Setter
    public void setWidth(double new_width){
        this.width = new_width;
    }
    public void setHeight(double new_height){
        this.height = new_height;
    }

    //Getter
    public double getWidth(){
        return this.width;
    }
    public double getHeight(){
        return this.height;
    }

    //Method
    public String printRectangle(){
        return "{ width = " + this.width + " height = " + this.height + " " + super.toString() + " }";
    }
}