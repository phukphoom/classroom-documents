import java.util.ArrayList;

public class Student{
    //Data Field
    private String id;
    private String studentName;

    private ArrayList<Course> courseList = new ArrayList<Course>();
    private int numberOfCourse;
    
    //Constructor
    public Student(){  
    }
    public Student(String id, String student_name){
        this.id = id;  
        this.studentName = student_name;
    }

    //Setter
    public void setId(String new_id){
        this.id = new_id;
    }
    public void setName(String new_name){
        this.studentName = new_name;
    }
    
    //Getter
    public String getId(){
        return this.id;
    }
    public String getStudentName(){
        return this.studentName;
    }
    public ArrayList<Course> getCourses(){
        return this.courseList;
    }
    public int getNumberOfCourse(){
        return this.numberOfCourse;
    }

    //Method
    public void addCourse(Course new_course){
        this.courseList.add(new_course);
        this.numberOfCourse = this.courseList.size();
    }

    @Override
    public String toString(){
        return "id : " + this.id + " studnetName : " + this.studentName + " numberOfCourse " + this.numberOfCourse + "  ";
    }
}