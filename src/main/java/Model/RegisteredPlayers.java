package Model;

public class RegisteredPlayers {
    private int matchId;
    private int points;
    private int assists;
    private int rebounds;
    private int steals;
    private int blocks;
    private int clubId;
    private int personId;
    private int positionId;

    public RegisteredPlayers(int matchId, int points, int assists, int rebounds, int steals, int blocks, int clubId, int personId, int positionId) {
        this.matchId = matchId;
        this.points = points;
        this.assists = assists;
        this.rebounds = rebounds;
        this.steals = steals;
        this.blocks = blocks;
        this.clubId = clubId;
        this.personId = personId;
        this.positionId = positionId;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getAssists() {
        return assists;
    }

    public void setAssists(int assists) {
        this.assists = assists;
    }

    public int getRebounds() {
        return rebounds;
    }

    public void setRebounds(int rebounds) {
        this.rebounds = rebounds;
    }

    public int getSteals() {
        return steals;
    }

    public void setSteals(int steals) {
        this.steals = steals;
    }

    public int getBlocks() {
        return blocks;
    }

    public void setBlocks(int blocks) {
        this.blocks = blocks;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    @Override
    public String toString() {
        return "RegisteredPlayers{" +
                "matchId=" + matchId +
                ", points=" + points +
                ", assists=" + assists +
                ", rebounds=" + rebounds +
                ", steals=" + steals +
                ", blocks=" + blocks +
                ", clubId=" + clubId +
                ", personId=" + personId +
                ", positionId=" + positionId +
                '}';
    }
}
