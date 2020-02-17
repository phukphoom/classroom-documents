import java.util.Date;

public class GeoMetric {
    //Data Filed
    private String color;
    private boolean isFilled;
    private Date dateCreated;

    //Constructor
    public GeoMetric(){
        System.out.println("LOG => GeoMetric constructor is involked");
    }
    public GeoMetric(String color, boolean isFilled, Date dateCreated){
        this.color = color;
        this.isFilled = isFilled;
        this.dateCreated = dateCreated;
    }

    //Setter
    public void setColor(String new_color){
        this.color = new_color;
    }
    public void setIsFilled(boolean new_isFilled){
        this.isFilled = new_isFilled;
    }
    public void setDateCreated(Date new_dateCreated){
        this.dateCreated = new_dateCreated;
    }

    //Getter
    public String getColor(){
        return this.color;
    }
    public boolean getIsFilled(){
        return this.isFilled;
    }
    public Date getDateCreated(){
        return this.dateCreated;
    }

    //Method
    public String toString(){
        return "{ color = " + this.color + " isFilled = " + this.isFilled + " dateCreated = " + this.dateCreated + " }";
    }
}