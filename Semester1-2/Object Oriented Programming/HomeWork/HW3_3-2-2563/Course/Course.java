import java.util.ArrayList;

public class Course{
    //Data Field
    private String courseName;

    private ArrayList<Student> studentList = new ArrayList<Student>();
    private int numberOfStudent;

    //Constructor
    public Course(){
    }
    public Course(String course_name){
        this.courseName = course_name;
    }

    //Setter
    public void setName(String new_name){
        this.courseName = new_name;
    }

    //Getter
    public String getCourseName(){
        return this.courseName;
    }
    public ArrayList<Student> getStudents(){
        return this.studentList;
    }
    public int getNumberOfStudent(){
        return this.numberOfStudent;
    }

    //Method
    public void addStudent(Student new_student){
        new_student.addCourse(this);
        this.studentList.add(new_student);
        this.numberOfStudent = this.studentList.size();
    }
    public void dropStudent(String id, String student_name){
        for(int i=0; i<this.studentList.size(); i++){
            if(studentList.get(i).getId() == id && studentList.get(i).getStudentName() == student_name){
                studentList.remove(i);
                this.numberOfStudent = this.studentList.size();
            }
        }
    }
    public void clear(){
        if(!studentList.isEmpty()){
            this.studentList.clear();
            this.numberOfStudent = this.studentList.size();
        }
    }

    @Override
    public String toString(){
        return "courseName : " + this.courseName + "\nstudent : " + this.studentList.toString() + "\nnumberOfStudent : " + this.numberOfStudent;
    }
}