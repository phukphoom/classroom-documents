//Concret Class
public class Chicken extends Animal implements Edible{

    //Override superclass method 
    public String sound(){
        return "Ek E Ekkk!!";
    }
    
    //Override interface method
    public String howToEat(){
        return "Cooking";
    }
}