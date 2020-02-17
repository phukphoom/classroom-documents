public class Faculty extends Employee{
    public static void main(String[] args){
        new Faculty(); // anonymous object
    }

    public Faculty(){
        System.out.println("4. Faculty no-args constructor involked");
    }
}

class Employee extends Person{
    public Employee(){
        this("2. Employee constructor involked");
        System.out.println("3. Employee no-args constructor involked");
    }
    public Employee(String msg){
        System.out.println(msg);
    }
}

class Person extends Object{
    public Person(){
        System.out.println("1. Person no-args constructor involked");
    }
}
