package Model;

public class PositionOnTable {
    private int clubId;
    private int seasonId;
    private int leagueId;
    private int position;

    public PositionOnTable(int clubId, int seasonId, int leagueId, int position) {
        this.clubId = clubId;
        this.seasonId = seasonId;
        this.leagueId = leagueId;
        this.position = position;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public int getSeasonId() {
        return seasonId;
    }

    public void setSeasonId(int seasonId) {
        this.seasonId = seasonId;
    }

    public int getLeagueId() {
        return leagueId;
    }

    public void setLeagueId(int leagueId) {
        this.leagueId = leagueId;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "PositionOnTable{" +
                "clubId=" + clubId +
                ", seasonId=" + seasonId +
                ", leagueId=" + leagueId +
                ", position=" + position +
                '}';
    }
}
