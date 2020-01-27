public class TestRegularPolygon{
    public static void main(String[] args){
        
        RegularPolygon[] shape = new RegularPolygon[3];

        shape[0] = new RegularPolygon();
        shape[1] = new RegularPolygon(6,4);
        shape[2] = new RegularPolygon(10,4,5.6,7.8);

        for (RegularPolygon regularPolygon : shape) {
            System.out.println("-------------------------------------------------");
            System.out.println("Perimeter = " + regularPolygon.getPerimeter() + " " + "Area = " + regularPolygon.getArea());
        }
    }
}