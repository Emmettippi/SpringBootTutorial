package it.objectmethod.world.util;

public class WorldError {
	private boolean cityName;
	private boolean cityCountry;
	private boolean cityPopulation;
	private boolean cityDistrict;
	private boolean cityNameAlreadyExists;
	
	public boolean isCityName() {
		return cityName;
	}
	public void setCityName(boolean cityName) {
		this.cityName = cityName;
	}
	public boolean isCityCountry() {
		return cityCountry;
	}
	public void setCityCountry(boolean cityCountry) {
		this.cityCountry = cityCountry;
	}
	public boolean isCityPopulation() {
		return cityPopulation;
	}
	public void setCityPopulation(boolean cityPopulation) {
		this.cityPopulation = cityPopulation;
	}
	public boolean isCityDistrict() {
		return cityDistrict;
	}
	public void setCityDistrict(boolean cityDistrict) {
		this.cityDistrict = cityDistrict;
	}
	public boolean isCityNameAlreadyExists() {
		return cityNameAlreadyExists;
	}
	public void setCityNameAlreadyExists(boolean cityNameAlreadyExists) {
		this.cityNameAlreadyExists = cityNameAlreadyExists;
	}
	public boolean cityAtLeastOneError() {
		if(cityName||cityCountry||cityPopulation||cityDistrict||cityNameAlreadyExists) {
			return true;
		}
		return false;
	}
}
