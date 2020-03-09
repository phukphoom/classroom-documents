
public class TestProgram{
    public static void main(String[] args) {
        //Polymorphism
        GeoMetric obj1 = new Circle();
        GeoMetric obj2 = new Circle(20);
        GeoMetric obj3 = new Rectangle();
        GeoMetric obj4 = new Rectangle(10,20);

        //Show that using method that only defined in subclass with typecasting
        ((Circle)obj1).showInfo();
        ((Circle)obj2).showInfo();
        ((Rectangle)obj3).showInfo();
        ((Rectangle)obj4).showInfo();
        
        //Show that using overload method
        obj1.showSum(1);
        obj1.showSum(1,2);
        obj1.showSum(1,2,3);

        //Show dynamic blinding <use method in superclass>
        Circle circle = new Circle();
        circle.showSum(1);

        //Show instanceof operator
        if(circle instanceof GeoMetric){
            System.out.println("Instance");
        }
        else{
            System.out.println("Not instance");
        }
    }
}