public abstract class GeoMetric implements Colorable{
    //Data Field
    private double area;

    //Constructor
    public GeoMetric(){
    }
    public GeoMetric(double area){
        this.area = area;
    }

    //Setter
    public void setArea(double area){
        this.area = area;
    }

    //Getter
    public double getArea(){
        return this.area;
    }

    @Override
    public void howToColor(){
    }
}