package com.example.kosarkasidb;

import DbConnection.Worker;
import Model.Match;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class MatchesViewController implements Initializable {
    @FXML
    TableView<Match> allMatches;

    @FXML
    TableColumn<Match, String> homeTeams;

    @FXML
    TableColumn<Match, String> guestTeams;

    @FXML
    TableColumn<Match, Timestamp> dateTime;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle){
        homeTeams.setCellValueFactory(new PropertyValueFactory<>("homeTeamName"));
        guestTeams.setCellValueFactory(new PropertyValueFactory<>("guestsTeamName"));
        dateTime.setCellValueFactory(new PropertyValueFactory<>("matchDate"));

        ArrayList<Match> matchArrayList = Worker.getMatches();

        for(Match match : matchArrayList){
            allMatches.getItems().add(match);
        }
    }
}
