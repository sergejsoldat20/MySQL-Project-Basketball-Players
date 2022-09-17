package com.example.kosarkasidb;

import DbConnection.Worker;
import Model.BasketballPlayer;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;
import org.controlsfx.control.CheckComboBox;

import java.util.ArrayList;

public class LeaguesViewController {
    @FXML
    TextField dateTime;

    @FXML
    Button showGames;

    @FXML
    Button addGame;

    @FXML
    CheckComboBox<String> registerHomePlayers;

    @FXML
    CheckComboBox <String>registerAwayPlayers;

    @FXML
    ComboBox<String> chooseHomeCity;

    @FXML
    ComboBox <String>chooseGuestCity;

    @FXML
    ComboBox <String>chooseHomeClub;

    @FXML
    ComboBox <String>chooseGuestClub;

    @FXML
    ComboBox <String>chooseCountry;

    @FXML
    Label leagueName;

    @FXML
    void initialize() {
        Worker.getAllCountries();
        chooseCountry.getItems().addAll(Worker.allCountries);
        chooseCountry.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>(){
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String str , String countryName) {
                //System.out.println(countryName);
                chooseHomeCity.getItems().clear();
                chooseHomeCity.getItems().addAll(Worker.getCitiesFromCountry(countryName));
                chooseGuestCity.getItems().clear();
                chooseGuestCity.getItems().addAll(Worker.getCitiesFromCountry(countryName));
            }
        });
        chooseHomeCity.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue observableValue, String o, String cityName) {
                chooseHomeClub.getItems().clear();
                chooseHomeClub.getItems().setAll(Worker.getTeamsFromCity(cityName));

            }
        });
        chooseGuestCity.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue observableValue, String o, String cityName) {
                chooseGuestClub.getItems().clear();
                chooseGuestClub.getItems().setAll(Worker.getTeamsFromCity(cityName));

            }
        });
        chooseHomeClub.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue observableValue, String p, String club) {

                registerHomePlayers.getItems().setAll(Worker.getPlayersFromClub(club));
            }
        });
        chooseGuestClub.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue observableValue, String p, String club) {

                registerAwayPlayers.getItems().setAll(Worker.getPlayersFromClub(club));
            }
        });
    }


    public void setOnActionAddGame(MouseEvent event){
        String homeClub = chooseHomeClub.getSelectionModel().getSelectedItem();
        String guestClub = chooseGuestClub.getSelectionModel().getSelectedItem();
        ObservableList<String> homePlayersObservableList =  registerHomePlayers.getCheckModel().getCheckedItems();
        ObservableList<String> guestPlayersObservableList =  registerAwayPlayers.getCheckModel().getCheckedItems();
        ArrayList<String> homePlayers = new ArrayList<>();
        ArrayList<String> guestPlayers = new ArrayList<>();
        for(String s : homePlayersObservableList){
            homePlayers.add(s);
        }
        for(String s : guestPlayersObservableList){
            guestPlayers.add(s);
        }
        String dTime = dateTime.getText();

        System.out.println(homeClub + " - " + guestClub + " - " + dTime);
        Worker.addNewGame(homeClub,guestClub,dTime);

        int matchId = Worker.getMatchId(homeClub, guestClub);

        for(String s : homePlayers){
            int playerId = BasketballPlayer.getIdFromName(s.split(" ")[0],s.split(" ")[1]);
            int positionId = BasketballPlayer.getPosition(playerId);
            int clubId = Worker.getIdFromClubName(homeClub);
            Worker.addRegisteredPlayers(matchId,clubId,playerId,positionId);
        }

        for(String s : guestPlayers){
            int playerId = BasketballPlayer.getIdFromName(s.split(" ")[0],s.split(" ")[1]);
            int positionId = BasketballPlayer.getPosition(playerId);
            int clubId = Worker.getIdFromClubName(homeClub);
            Worker.addRegisteredPlayers(matchId,clubId,playerId,positionId);
        }

    }

    public void setOnActionShowGames(MouseEvent event){
        try{
            Stage stage = new Stage();
            stage.initModality(Modality.APPLICATION_MODAL);
            FXMLLoader loader = new FXMLLoader(getClass().getResource("matches-view.fxml"));
            Parent root = loader.load();
            Scene scene = new Scene(root);
            stage.setTitle("Svi mecevi");
            stage.setScene(scene);
            stage.show();
        }catch (Exception e){}
    }
}
