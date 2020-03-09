public class TestProgram{
    public static void main(String[] args){
        GeoMetric circle1 = new Circle(100);
        GeoMetric rectangle1 = new Rectangle(100);
        GeoMetric circle2 = new Circle(200);
        GeoMetric rectangle2 = new Rectangle(200);

        GeoMetric.max(circle1,rectangle1);
        GeoMetric.max(circle2,rectangle2);

        GeoMetric.max(circle1,rectangle2);
        GeoMetric.max(circle2,rectangle1);

        GeoMetric.max(circle1,circle2);
        GeoMetric.max(rectangle1,rectangle2);
    }
}