public class Project extends Assignment{
    //Data Fileds
    private String specification;
    private String dataFile;

    //Constructor
    public Project(String name, int month, int day, int hour, int minute, String specification, String dataFile){
        super(name, month, day, hour, minute);
        this.specification = specification;
        this.dataFile = dataFile;
    }

    //Method
    public String toString(){
        return super.toString() + "\n\tspecification = " + this.specification + "; data file = " + this.dataFile;
    }
}