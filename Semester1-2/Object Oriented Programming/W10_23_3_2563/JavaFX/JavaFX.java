import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class JavaFX extends Application {
    public static void main(String[] args) {
        launch();
    } 

    @Override
    public void start(Stage stage) throws Exception {

        Label label = new Label("Hello JavaFX");
        label.setAlignment(Pos.BASELINE_CENTER);

        Scene scence = new Scene(label);

        stage.setScene(scence);
        stage.setTitle("JavaFX Application");
        stage.setWidth(800);
        stage.setHeight(600);
        stage.show();
    }
} 