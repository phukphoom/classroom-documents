public class TestProgram{
    public static void main(String[] args){
        GeoMetric geoMetricArray[] = new GeoMetric[5];
        geoMetricArray[0] = new Square(100);
        geoMetricArray[1] = new Circle(200);
        geoMetricArray[2] = new Square(300);
        geoMetricArray[3] = new Circle(400);
        geoMetricArray[4] = new Square(500);

        for (GeoMetric geoMetric : geoMetricArray) {
            System.out.print("Area = > " + geoMetric.getArea() + " | ");
            geoMetric.howToColor();
        }
    }
}