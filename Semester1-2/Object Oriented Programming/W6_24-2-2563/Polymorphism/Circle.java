public class Circle extends GeoMetric{
    //Data Fields
    private  double radius;

    //Constructor
    public Circle(){
        super();
    }
    public Circle(double radius){
        super();
        this.radius = radius;
    }

    //Method
    public void showInfo(){
        System.out.println("Radius = " + this.radius);
    }
} 