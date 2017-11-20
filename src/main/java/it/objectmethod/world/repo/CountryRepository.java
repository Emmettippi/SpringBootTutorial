package it.objectmethod.world.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import it.objectmethod.world.model.Country;

public interface CountryRepository extends  JpaRepository<Country, String>{
	@Query(value="SELECT DISTINCT Continent FROM world.country ORDER BY Continent ASC", nativeQuery=true)
	public List<String> getAllContinent();
	
	@Query(value="SELECT * FROM world.country WHERE Continent=?1 ORDER BY Name ASC", nativeQuery=true)
	public List<Country> getCountryListFromContinent(String continent);
	
	@Query(value="SELECT * FROM world.country ORDER BY Name ASC", nativeQuery=true)
	public List<Country> findAllOrderedByName();
}
