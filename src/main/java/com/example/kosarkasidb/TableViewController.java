package com.example.kosarkasidb;

import DbConnection.Worker;
import Model.Match;
import Model.Table;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class TableViewController implements Initializable {

    @FXML
    TableView<Table> table;

    @FXML
    TableColumn<Table, String> clubPosition;

    @FXML
    TableColumn<Table, String> clubName;

    public String stateName;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle){
        clubPosition.setCellValueFactory(new PropertyValueFactory<>("tablePosition"));
        clubName.setCellValueFactory(new PropertyValueFactory<>("clubName"));
        Platform.runLater(() -> {
            ArrayList<Table> tableDb = Worker.getTable(stateName);
            for(Table t : tableDb){
                table.getItems().add(t);
            }
        });
    }

    public void sendStateToController(String message){
        this.stateName = message;
    }
}
