public class Main {
    public static void main(String[] args) {
        final int width = 4;
        final int height = 5;
        Shape shape_1 = new Rectangle(width, height);
        System.out.println("==== Rectangle ====");
        System.out.println("Width = " + width);
        System.out.println("Height = " + height);
        System.out.println("Area = " + shape_1.getArea());

        final int side = 5;
        Shape shape_2 = new Square(side);
        System.out.println("====   Square  ====");
        System.out.println("Side = " + side);
        System.out.println("Area = " + shape_2.getArea());
    }
}
