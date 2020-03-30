import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;

public class CircleControl extends Application {
    //Data Fileds
    CirclePane circlePane = new CirclePane(5);

    //Method
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        //Setup BorderPane
        BorderPane borderPane = new BorderPane();

        //Setup HboxPane
        HBox hbox = new HBox(10);
        hbox.setAlignment(Pos.CENTER);

        //Add any Buttons in HBoxPane
        Button enlargeBtn = new Button("ENLARGE");
        Button shrinkBtn = new Button("SHRINK");
        hbox.getChildren().addAll(enlargeBtn,shrinkBtn);

        //Register Event Handle to Buttons with Anonymous Handler Class
        enlargeBtn.setOnAction(e->{
            circlePane.enlarge();
        });
        shrinkBtn.setOnAction(e->{
            circlePane.shrink();
        });

        //Add any Pane in BorderPane
        borderPane.setCenter(circlePane);
        borderPane.setBottom(hbox);

        //Setup Scene
        Scene scene = new Scene(borderPane, 400, 200);
        stage.setTitle("CircleControl Application");
        stage.setScene(scene);

        //Show Scene
        stage.show();
    }
}

class CirclePane extends StackPane{
    //Data Fildes
    private Circle circle = new Circle();

    //Constructor
    public CirclePane(double radius){
        circle.setRadius(radius);
        getChildren().add(circle);
    }

    //Method
    public void enlarge(){
        if(this.circle.getRadius()+5<=50){
            circle.setRadius(circle.getRadius()+5);
        }
    }
    public void shrink(){
        if(this.circle.getRadius()-5>=5){
            circle.setRadius(circle.getRadius()-5);
        }
    }
}