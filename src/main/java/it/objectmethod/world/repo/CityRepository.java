package it.objectmethod.world.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import it.objectmethod.world.model.City;

public interface CityRepository extends JpaRepository<City, Long>{
	@Query(value="SELECT * FROM world.city JOIN world.country ON city.CountryCode=country.Code WHERE country.Code=?1 ORDER BY City.Name ASC", nativeQuery=true)
	public List<City> getCityListFromCountry(String CountryCode);
	
	@Query(value="SELECT * FROM world.city WHERE Name=?1", nativeQuery=true)
	public City getCityFromName(String name);
	
	@Query(value="SELECT * FROM world.city WHERE Name=?1 AND CountryCode=?2", nativeQuery=true)
	public City getCityFromNameAndCountry(String name,String countryCode);
}
