public class Assignment{
    //Data Fields
    private String name;
    private int month;
    private int day;
    private int hour;
    private int minute;
    private double score;
    private double totalPoints;
    private double totalWeight;

    //Constructor
    public Assignment(String name, int month, int day, int hour, int minute){
        this.name = name;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
    }

    //Getter
    public String getName(){
        return this.name;
    }
    public int getMonth(){
        return this.month;
    }
    public int getDay(){
        return this.day;
    }
    public int getHour(){
        return this.hour;
    }
    public int getMinute(){
        return this.minute;
    }
    public double getScore(){
        return this.score;
    }
    public double getTotalPoints(){
        return this.totalPoints;
    }
    public double getTotalWeight(){
        return this.totalWeight;
    }

    //Setter
    public void setScore(double score){
        this.score = score;
    }
    public void setTotalPoints(double points){
        this.totalPoints = points;
    }
    public void setTotalWeight(double weight){
        this.totalWeight = weight;
    }

    //Method
    public String toString(){
        return this.name + "(date : " + this.month + "-" + this.day  + " at " + this.hour + ":" + this.minute + "):" + " score = " + this.score + "; totalPoints = " + this.totalPoints + "; totalWeight = " + this.totalWeight;
    }
}