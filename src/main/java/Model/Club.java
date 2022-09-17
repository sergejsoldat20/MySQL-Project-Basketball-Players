package Model;

public class Club {
    private int clubId;
    private String clubName;
    private String cityId;
    private String cityName;
    private String arenaName;
    private String countryName;
    private int arenaId;
    private int arenaCapacity;


    public Club(){

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

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getArenaName() {
        return arenaName;
    }

    public void setArenaName(String arenaName) {
        this.arenaName = arenaName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public int getArenaId() {
        return arenaId;
    }

    public void setArenaId(int arenaId) {
        this.arenaId = arenaId;
    }

    public void setArenaCapacity(int arenaCapacity) {
        this.arenaCapacity = arenaCapacity;
    }

    public int getArenaCapacity() {
        return arenaCapacity;
    }

    @Override
    public String toString() {
        return "Club{" +
                "clubId=" + clubId +
                ", clubName='" + clubName + '\'' +
                ", cityId='" + cityId + '\'' +
                ", cityName='" + cityName + '\'' +
                ", arenaName='" + arenaName + '\'' +
                ", countryName='" + countryName + '\'' +
                ", arenaId=" + arenaId +
                '}';
    }
}
