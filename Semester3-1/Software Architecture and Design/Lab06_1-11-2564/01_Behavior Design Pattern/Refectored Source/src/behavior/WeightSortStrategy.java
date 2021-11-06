package behavior;

import java.util.Comparator;
import java.util.List;

public class WeightSortStrategy implements SortStrategy {
    // YOU MAY ADD UP TO 5 LINES OF CODE BELOW THIS COMMENT !! A LINE OF CODE MAY CONTAIN UP TO ONE SEMI-COLON !!
    public void customSort(List<Person> people){
        people.sort(Comparator.comparing(Person::getWeight));
    }
}