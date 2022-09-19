package Model;

public class Table {
    private int clubId;
    private String clubName;
    private int tablePosition;

    public Table(){

    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public int getTablePosition() {
        return tablePosition;
    }

    public void setTablePosition(int tablePosition) {
        this.tablePosition = tablePosition;
    }

    @Override
    public String toString() {
        return "Table{" +
                "clubId=" + clubId +
                ", clubName='" + clubName + '\'' +
                ", tablePosition=" + tablePosition +
                '}';
    }
}
