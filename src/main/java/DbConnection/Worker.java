package DbConnection;

import Model.*;

import java.sql.*;
import java.util.ArrayList;

public class Worker {

    public static ArrayList<String> allCountries = new ArrayList<>();

    public static ArrayList<String> getTeamsFromCity(String cityName){
        ArrayList<Club> getAll = getClubs();
        ArrayList<String> result = new ArrayList<>();
        for(Club club : getAll){
            if(club.getCityName().equals(cityName)) {
                result.add(club.getClubName());
            }
        }
        return result;
    }

    public static ArrayList<String> getCitiesFromCountry(String countryName){
        ArrayList<City> getAll = getCities();
        ArrayList<String> result = new ArrayList<>();
        for(City city : getAll){
            if(city.getCountryName().equals(countryName)) {
                result.add(city.getCityName());
            }
        }
        return result;
    }

    public static void getAllCountries(){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM mydb.drzava";

        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                String countryName = resultSet.getString("naziv");
                allCountries.add(countryName);
            }
        } catch (Exception ex) {
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
    }

    public static boolean login(String username, String password){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM mydb.administrator";
        ArrayList<Administrator> adminList = new ArrayList<>();
        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                Administrator admin = new Administrator();
                admin.setPassword(resultSet.getString("lozinka"));
                admin.setUsername(resultSet.getString("korisnickoIme"));
                adminList.add(admin);
            }
        } catch (Exception ex) {
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
        for(Administrator administrator : adminList){
            if(administrator.getUsername().equals(username) && administrator.getPassword().equals(password)){
                return true;
            }
        }
        return false;
    }

    public static ArrayList<Match> getMatches(){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM get_matches";
        ArrayList<Match> allMatches = new ArrayList<>();
        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                Match match = new Match();
                match.setMatchId(resultSet.getInt("idUtakmica"));
                match.setLeagueId(resultSet.getInt("idLiga"));
                match.setMatchDate(resultSet.getTimestamp("datumVrijeme"));
                match.setHomeId(resultSet.getInt("idDomaci"));
                match.setGuestsId(resultSet.getInt("idGosti"));
                match.setGuestsTeamName(resultSet.getString("gosti"));
                match.setHomeTeamName(resultSet.getString("domaci"));
                allMatches.add(match);
            }
        } catch (Exception ex) {
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
        return allMatches;
    }


    public static ArrayList<City> getCities(){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM get_cities";
        ArrayList<City> cities = new ArrayList<>();
        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                City city = new City();
                city.setCityId(resultSet.getInt("idGrad"));
                city.setCityName(resultSet.getString("grad"));
                city.setCountryName(resultSet.getString("drzava"));
                city.setStateId(resultSet.getInt("idDrzava"));
                cities.add(city);
            }
        } catch (Exception ex) {
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
        return cities;
    }

    public static ArrayList<Club> getClubs(){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM get_clubs";
        ArrayList<Club> allClubs = new ArrayList<>();
        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                Club club = new Club();
                club.setClubId(resultSet.getInt("id"));
                club.setClubName(resultSet.getString("naziv"));
                club.setArenaName(resultSet.getString("nazivDvorane"));
                club.setArenaCapacity(resultSet.getInt("kapacitetDvorane"));
                club.setCityName(resultSet.getString("grad"));
                club.setCountryName(resultSet.getString("drzava"));
                club.setCityId(resultSet.getString("idGrad"));
                allClubs.add(club);
            }
        } catch (Exception ex) {
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
        return allClubs;
    }

    public static ArrayList<BasketballPlayer> getPlayers(){

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT * From get_players";
        ArrayList<BasketballPlayer> allPlayers = new ArrayList<>();
        try{
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            while(resultSet.next()){
                BasketballPlayer player = new BasketballPlayer();
                player.setPersonId(resultSet.getInt("idOsoba"));
                player.setAverageAssists(resultSet.getDouble("prosjekAsistencija"));
                player.setAveragePoints(resultSet.getDouble("prosjekPoena"));
                player.setAverageRebounds(resultSet.getDouble("prosjekSkokova"));
                player.setJerseyNumber(resultSet.getInt("brojDresa"));
                player.setHeight(resultSet.getShort("visina"));
                player.setWeihgt(resultSet.getFloat("tezina"));
                player.setClubId(resultSet.getInt("idKlub"));
                player.setClubName(resultSet.getString("imeKluba"));
                player.setName(resultSet.getString("ime"));
                player.setSurname(resultSet.getString("prezime"));

                allPlayers.add(player);
            }
        } catch (Exception ex) {
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

        return allPlayers;
    }

    public static ArrayList<String> getPlayersFromClub(String clubName){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "select ime, prezime from get_players\n" +
                "where get_players.imeKluba=?";
        ArrayList<String> players = new ArrayList<>();
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setString(1,clubName);

            resultSet = statement.executeQuery();

            while(resultSet.next()){
                String name = resultSet.getString("ime") + " " + resultSet.getString("prezime");
                System.out.println(name);
                players.add(name);
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
        return players;
    }

    public static int getIdFromClubName(String team){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT idKlub FROM klub where klub.naziv=?";
        ArrayList<String> players = new ArrayList<>();
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setString(1,team);

            resultSet = statement.executeQuery();

            if(resultSet.next()) {
                return resultSet.getInt("idKlub");
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

    public static void addNewGame(String home, String away, String dateTime){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        Timestamp dTime = Timestamp.valueOf(dateTime);
        int homeId = getIdFromClubName(home);
        int guestId = getIdFromClubName(away);
        String query = "INSERT INTO utakmica (datumVrijeme, idDomaci, idGosti ,idLiga)VALUES(?,?,?,?)";
        ArrayList<String> players = new ArrayList<>();
        try {
            //id++;
            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

           // statement.setInt(1,id);
            statement.setTimestamp(1,dTime);
            statement.setInt(2,homeId);
            statement.setInt(3,guestId);
            statement.setInt(4,1);

            statement.executeUpdate();




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
    }


    public static int getMatchId(String home, String guest){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        int homeId = getIdFromClubName(home);
        int guestId = getIdFromClubName(guest);
        String query = "SELECT idUtakmica FROM mydb.utakmica where idDomaci=? and idGosti=?";
        ArrayList<String> players = new ArrayList<>();
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setInt(1,homeId);
            statement.setInt(2,guestId);

            resultSet = statement.executeQuery();

            if(resultSet.next()) {
                return resultSet.getInt("idUtakmica");
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

    public static void addRegisteredPlayers(int matchId, int clubId, int playerId, int positionId){
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "INSERT INTO kosarkas_registrovan_za_utakmicu (idUtakmica, brojPoena, brojAsistencija, brojSkokova, ukradeneLopte, blokade" +
                "idKlub, idOsoba, idPozicija)VALUES(?,?,?,?,?,?,?,?,?)";
        ArrayList<String> players = new ArrayList<>();
        try {

            connection = ConnectionPool.getInstance().checkOut();
            statement = connection.prepareStatement(query);

            statement.setInt(1,matchId);
            statement.setInt(2,0);
            statement.setInt(3,0);
            statement.setInt(4,0);
            statement.setInt(5,0);
            statement.setInt(6,0);
            statement.setInt(7,clubId);
            statement.setInt(8,playerId);
            statement.setInt(9,positionId);
            statement.executeUpdate();



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
    }



    public static void main(String args[]){
        //getAllCountries();
       // allCountries.stream().forEach(System.out::println);
       // addNewGame("Borac", "Crvena Zvezda","2022-12-12 18:00:00");
    }

}
