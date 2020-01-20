public class Rectangle {
    // Data field
    double width = 1.0;
    double height = 1.0;
    double border = 1.0;
    String color = "Black";
    boolean isFilled = false;

    // Constructor
    Rectangle(){
    }
    Rectangle(double width,double height, double border, String color,boolean fill){
        this.width = width;
        this.height = height;
        this.border = border;
        this.color = color;
        this.isFilled = fill;
    }

    //Method
    double getArea(){
        return this.width*this.height;
    }
}