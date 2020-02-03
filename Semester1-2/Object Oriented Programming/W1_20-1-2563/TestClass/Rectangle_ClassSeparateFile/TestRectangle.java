public class TestRectangle{
    public static void main(String[] args) {
        Rectangle rectangle1 = new Rectangle();
        System.out.println("++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("width = " + rectangle1.width);
        System.out.println("height = " + rectangle1.height);
        System.out.println("border = " + rectangle1.border);
        System.out.println("color = " + rectangle1.color);
        System.out.println("filled = " + rectangle1.isFilled);
        System.out.println("area = " + rectangle1.getArea());

        Rectangle rectangle2 = new Rectangle(10,10,2,"Red",true);
        System.out.println("++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("width = " + rectangle2.width);
        System.out.println("height = " + rectangle2.height);
        System.out.println("border = " + rectangle2.border);
        System.out.println("color = " + rectangle2.color);
        System.out.println("filled = " + rectangle2.isFilled);
        System.out.println("area = " + rectangle2.getArea());
    }
}