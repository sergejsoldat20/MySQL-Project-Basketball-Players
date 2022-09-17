package Model;

import java.sql.Timestamp;

public class Match {
    private int matchId;
    private Timestamp matchDate;
    private int guestsId;
    private int homeId;
    private int leagueId;
    private String guestsTeamName;
    private String homeTeamName;

    public Match(){

    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public Timestamp getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(Timestamp matchDate) {
        this.matchDate = matchDate;
    }

    public int getGuestsId() {
        return guestsId;
    }

    public void setGuestsId(int guestsId) {
        this.guestsId = guestsId;
    }

    public int getHomeId() {
        return homeId;
    }

    public void setHomeId(int homeId) {
        this.homeId = homeId;
    }

    public int getLeagueId() {
        return leagueId;
    }

    public void setLeagueId(int leagueId) {
        this.leagueId = leagueId;
    }

    public String getGuestsTeamName() {
        return guestsTeamName;
    }

    public void setGuestsTeamName(String guestsTeamName) {
        this.guestsTeamName = guestsTeamName;
    }

    public String getHomeTeamName() {
        return homeTeamName;
    }

    public void setHomeTeamName(String homeTeamName) {
        this.homeTeamName = homeTeamName;
    }

    @Override
    public String toString() {
        return "Match{" +
                "matchId=" + matchId +
                ", matchDate=" + matchDate +
                ", guestsId=" + guestsId +
                ", homeId=" + homeId +
                ", leagueId=" + leagueId +
                ", guestsTeamName='" + guestsTeamName + '\'' +
                ", homeTeamName='" + homeTeamName + '\'' +
                '}';
    }
}
