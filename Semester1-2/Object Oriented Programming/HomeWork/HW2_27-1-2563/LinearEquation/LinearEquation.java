public class LinearEquation{
    //Data Field
    private double a,b,c,d,e,f;

    //Constructor
    public LinearEquation(){
    }
    public LinearEquation(double new_a,double new_b,double new_c,double new_d,double new_e,double new_f){
        this.a = new_a;
        this.b = new_b;
        this.c = new_c;
        this.d = new_d;
        this.e = new_e;
        this.f = new_f;
    }

    //Setter
    public void setA(double new_a){
        this.a = new_a;
    }
    public void setB(double new_b){
        this.b = new_b;
    }
    public void setC(double new_c){
        this.c = new_c;
    }
    public void setD(double new_d){
        this.d = new_d;
    }
    public void setE(double new_e){
        this.e = new_e;
    }
    public void setF(double new_f){
        this.f = new_f;
    }

    //Getter
    public double getA(){
        return this.a;
    }
    public double getB(){
        return this.b;
    }
    public double getC(){
        return this.c;
    }
    public double getD(){
        return this.d;
    }
    public double getE(){
        return this.e;
    }
    public double getF(){
        return this.f;
    }

    //Method
    public boolean isSolvable(){
        if((a*d)-(b*c) != 0){
            return true;
        }
        else{
            return false;
        }
    }
    public double getX(){
        return ((this.e*this.d)-(this.b*this.f)) / ((this.a*this.d)-(this.b*this.c));
    }
    public double getY(){
        return ((this.a*this.f)-(this.e*this.c)) / ((this.a*this.d)-(this.b*this.c));
    }
}