package Model;

public class League {
    private int leagueId;
    private int stateId;
    private String leagueName;

    public League(int leagueId, int stateId, String leagueName) {
        this.leagueId = leagueId;
        this.stateId = stateId;
        this.leagueName = leagueName;
    }

    public int getLeagueId() {
        return leagueId;
    }

    public void setLeagueId(int leagueId) {
        this.leagueId = leagueId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getLeagueName() {
        return leagueName;
    }

    public void setLeagueName(String leagueName) {
        this.leagueName = leagueName;
    }

    @Override
    public String toString() {
        return "League{" +
                "leagueId=" + leagueId +
                ", stateId=" + stateId +
                ", leagueName='" + leagueName + '\'' +
                '}';
    }
}
