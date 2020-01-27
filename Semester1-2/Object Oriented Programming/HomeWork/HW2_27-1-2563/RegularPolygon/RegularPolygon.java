public class RegularPolygon{
    //Data Field
    private int numberOfConner;
    private double sideLenght;
    private double x;
    private double y;

    //Constructor
    public RegularPolygon(){
    }
    public RegularPolygon(int number_of_conner,double side_lenght){
        this.numberOfConner = number_of_conner;
        this.sideLenght = side_lenght;
    }
    public RegularPolygon(int number_of_conner, double side_lenght, double x, double y){
        this.numberOfConner = number_of_conner;
        this.sideLenght = side_lenght;
        this.x = x;
        this.y = y;
    }

    //Setter
    public void setNumberOfConner(int new_number_of_conner){
        this.numberOfConner = new_number_of_conner;
    }
    public void setSideLenght(double new_side_lenght){
        this.sideLenght = new_side_lenght;
    }
    public void setX(double new_x){
        this.x = new_x;
    }
    public void setY(double new_y){
        this.y = new_y;
    }

    //getter
    public int getNumberOfConner(){
        return this.numberOfConner;
    }
    public double getSideLenght(){
        return this.sideLenght;
    }
    public double getX(){
        return this.x;
    }
    public double getY(){
        return this.y;
    }

    //method
    public double getPerimeter(){
        return this.numberOfConner * this.sideLenght;
    }
    public double getArea(){
        return (this.numberOfConner*Math.pow(this.sideLenght,2))/(4*Math.tan(Math.PI/this.numberOfConner));
    }
}