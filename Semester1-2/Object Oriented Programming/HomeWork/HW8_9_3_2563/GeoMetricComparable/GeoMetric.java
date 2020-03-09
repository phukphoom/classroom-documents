public abstract class GeoMetric implements Comparable<GeoMetric>{
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

    //Method
    @Override
    public int compareTo(GeoMetric compare){
        if(this.area < compare.area){
            return -1;
        }
        else if(this.area > compare.area){
            return 1;
        }
        else{
            return 0;
        }
    }
    public static void max(GeoMetric x,GeoMetric y){
        
        if(x.compareTo(y)==-1){
            System.out.println("Max area => " + y.area);
        }
        else if(x.compareTo(y)==1){
            System.out.println("Max area => " + x.area);
        }
        else{
            System.out.println("Area is Equal");
        }
    }
}