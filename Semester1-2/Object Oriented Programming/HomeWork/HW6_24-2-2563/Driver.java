public class Driver{
    public static void main(String[] args){
        AssignmentList assignmentList = new AssignmentList();

        Assignment assignment_1 = new Assignment("Unit Testing", 12, 1, 23, 0);
        assignment_1.setScore(0.78);
        assignment_1.setTotalPoints(0.99);
        assignment_1.setTotalWeight(0.3);
        assignmentList.addItem(assignment_1);
        
        Assignment lab_1 = new Lab("Unit Testing", 12, 1, 23, 0,"UnitTesting.pdf");
        lab_1.setScore(0.78);
        lab_1.setTotalPoints(0.99);
        lab_1.setTotalWeight(0.3);
        assignmentList.addItem(lab_1);

        Assignment project_1 = new Project("Unit Testing", 12, 1, 23, 0,"UnitTesting.pdf","Snacks.csv");
        project_1.setScore(0.78);
        project_1.setTotalPoints(0.99);
        project_1.setTotalWeight(0.3);
        assignmentList.addItem(project_1);

        System.out.println(assignmentList.toString());
        System.out.println("------------------------------------------------------------------------------------------------------");
        System.out.println("Grade => " + assignmentList.computeCourseGrade());
        System.out.println("------------------------------------------------------------------------------------------------------");
    }
}