import java.util.ArrayList;

public class AssignmentList{
    //Data Fileds
    private ArrayList<Assignment> item = new ArrayList<Assignment>();

    //Constructor
    public AssignmentList(){
    }

    //Method
    public void addItem(Assignment item){
        this.item.add(item);
    }
    public double computeCourseGrade(){
        double a=0,b=0;
        for(int i=0;i<this.item.size();i++){
            //System.out.println("\t" + i + " ");
            a += (this.item.get(i).getTotalWeight()*this.item.get(i).getScore())/this.item.get(i).getTotalPoints();
                                //System.out.println("a->"+a);
            b += this.item.get(i).getTotalWeight();
                                //System.out.println("b->"+b);
        }
        return a/b;
    }
    public String toString(){
        String info = "";
        for(int i=0;i<this.item.size();i++){
            info += this.item.get(i).toString() + "\n";
        }
        return info;
    }
}