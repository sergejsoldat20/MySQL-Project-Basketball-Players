package Model;

public class City {
    private int cityId;
    private String cityName;
    private int stateId;
    private String countryName;

    public City(){

    }
    public City(int cityId, String cityName, int stateId) {
        this.cityId = cityId;
        this.cityName = cityName;
        this.stateId = stateId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    @Override
    public String toString() {
        return "City{" +
                "cityId=" + cityId +
                ", cityNamel='" + cityName + '\'' +
                ", stateId=" + stateId +
                ", countryName='" + countryName + '\'' +
                '}';
    }
}
