public class TestCourse{
    public static void main(String[] args){
        Course course = new Course("Object Oriented Programming");
        System.out.println(course.toString() + "\n");
        
        course.addStudent(new Student("62010001","A"));
        course.addStudent(new Student("62010002","B"));
        course.addStudent(new Student("62010003","C"));
        course.addStudent(new Student("62010004","D"));
        course.addStudent(new Student("62010005","E"));
        System.out.println(course.toString() + "\n");
        
        course.dropStudent("62010001","A");
        course.dropStudent("62010003","C");
        course.dropStudent("62010004","D");
        System.out.println(course.toString() + "\n");

        course.clear();
        System.out.println(course.toString());
    }
}