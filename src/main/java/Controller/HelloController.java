package Controller;

import DbConnection.Worker;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class HelloController {
    @FXML
    PasswordField passwordField;

    @FXML
    TextField usernameField;

    @FXML
    Button login;

    public void setOnActionLogin(MouseEvent event){
        String username = usernameField.getText();
        String password = passwordField.getText();
        if(Worker.login(username,password)){
            try {
                Stage newWindow = new Stage();
                newWindow.initModality(Modality.APPLICATION_MODAL);
                FXMLLoader loader = new FXMLLoader(getClass().getResource("leagues-view.fxml"));
                //QuizController controller = new QuizController();
                Parent root = loader.load();
                Scene scene = new Scene(root);
                newWindow.setScene(scene);
                newWindow.show();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}