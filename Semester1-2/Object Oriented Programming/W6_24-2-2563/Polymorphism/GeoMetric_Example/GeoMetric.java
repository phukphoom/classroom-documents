
public class GeoMetric{
    //Data Fields

    //Constuctor
    public GeoMetric(){        
    }

    //Method
    /*!!Bad Method for show overloading!!*/
    public void showSum(double a){                      //<<-- Overload Method
        System.out.println(a);
    }
    public void showSum(double a ,double b){            //<<-- Overload Method
        System.out.println(a+b);
    }
    public void showSum(double a ,double b, double c){  //<<-- Overload Method
        System.out.println(a+b+c);
    }
}