
public class Rectangle extends GeoMetric{
    //Data Fields
    private double width;
    private double height;

    //Constructor
    public Rectangle(){
        super();
    }
    public Rectangle(double width, double height){
        super();
        this.width = width;
        this.height = height;
    }

    //Method
    public void showInfo(){
        System.out.println("width = " + this.width + " Height = " + this.height);
    }
} 