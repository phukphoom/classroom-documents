
public class TestProgram{
    public static void main(String[] args) {
        Animal tiger1 = new Tiger();
        Tiger tiger2 = new Tiger();
        Animal chicken1 = new Chicken();
        Chicken chicken2 = new Chicken();

        System.out.println("Tiger_1 Sound => " + tiger1.sound());
        System.out.println("Tiger_2 Sound => " + tiger2.sound());
        System.out.println("Chicken_1 Sound => " + chicken1.sound());
        System.out.println("Chicken_2 Sound => " + chicken2.sound());
        System.out.println("How to eat chicken_1,chicken_2 => " + ((Chicken) chicken1).howToEat() + " , " + chicken2.howToEat());
    }
}