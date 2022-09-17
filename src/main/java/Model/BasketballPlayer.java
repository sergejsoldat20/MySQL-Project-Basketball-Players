package Model;

import DbConnection.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BasketballPlayer {
    private int personId;
    private String name;
    private String surname;
    private int clubId;
    private String clubName;
    private int jerseyNumber;
    private double averagePoints;
    private double averageAssists;
    private double averageRebounds;
    private int height;
    private float weihgt;

    public BasketballPlayer(){

    }

    public static int getPosition(int playerId) {

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT kp.idPozicija FROM \n" +
                "kosarkas k join kosarkas_igra_na_poziciji kp\n" +
                "on k.idOsoba=kp.idOsoba\n" +
                "where k.idOsoba=?";
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setInt(1,playerId);

            resultSet = statement.executeQuery();

            if(resultSet.next()){
                int id = resultSet.getInt("idPozicija");
                return id;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (resultSet != null)
                try {
                    resultSet.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

            if (statement != null)
                try {
                    statement.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

            ConnectionPool.getInstance().checkIn(connection);
        }
        return 0;
    }

    public static int getIdFromName(String name, String surname){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT idOsoba FROM osoba where osoba.ime=? and osoba.prezime=?";
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setString(1,name);
            statement.setString(2,surname);
            resultSet = statement.executeQuery();

            if(resultSet.next()){
                int id = resultSet.getInt("idOsoba");
                return id;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (resultSet != null)
                try {
                    resultSet.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

            if (statement != null)
                try {
                    statement.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

            ConnectionPool.getInstance().checkIn(connection);
        }
        return 0;
    }
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public int getJerseyNumber() {
        return jerseyNumber;
    }

    public void setJerseyNumber(int jerseyNumber) {
        this.jerseyNumber = jerseyNumber;
    }

    public double getAveragePoints() {
        return averagePoints;
    }

    public void setAveragePoints(double averagePoints) {
        this.averagePoints = averagePoints;
    }

    public double getAverageAssists() {
        return averageAssists;
    }

    public void setAverageAssists(double averageAssists) {
        this.averageAssists = averageAssists;
    }

    public double getAverageRebounds() {
        return averageRebounds;
    }

    public void setAverageRebounds(double averageRebounds) {
        this.averageRebounds = averageRebounds;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public float getWeihgt() {
        return weihgt;
    }

    public void setWeihgt(float weihgt) {
        this.weihgt = weihgt;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    @Override
    public String toString() {
        return "BasketballPlayer{" +
                "personId=" + personId +
                ", name=" + name +
                ", surname=" + surname +
                ", clubId=" + clubId +
                ", clubName=" + clubName +
                ", jerseyNumber=" + jerseyNumber +
                ", averagePoints=" + averagePoints +
                ", averageAssists=" + averageAssists +
                ", averageRebounds=" + averageRebounds +
                ", height=" + height +
                ", weihgt=" + weihgt +
                '}';
    }
}
