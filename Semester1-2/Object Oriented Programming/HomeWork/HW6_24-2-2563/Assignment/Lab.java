public class Lab extends Assignment{
    //Data Fileds
    private String specification;

    //Constructor
    public Lab(String name, int month, int day, int hour, int minute, String specification){
        super(name, month, day, hour, minute);
        this.specification = specification;
    }

    //Method
    public String toString(){
        return super.toString() + "\n\tspecification = " + this.specification;
    }
}