package it.objectmethod.world.controller.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import it.objectmethod.world.model.City;
import it.objectmethod.world.repo.CityRepository;
import it.objectmethod.world.repo.CountryRepository;

@RestController
@RequestMapping("/api/city")
public class CityRestController {

	//Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CityRepository cityRepo;

	@Autowired
	private CountryRepository countryRepo;

	@RequestMapping(value="/{country}/show_city_list",method=RequestMethod.GET)
	public @ResponseBody List<City> showCityListPerCountry(
			@PathVariable("country") String countryCode
//			@RequestParam("countryCode") String countryCode,
//			@RequestParam("countryName") String countryName) 
			){
		List<City> cityList = cityRepo.getCityListFromCountry(countryCode);
		return cityList;
	}
	
	@RequestMapping(value="/{country}/{city}/exists_city",method=RequestMethod.GET)
	public @ResponseBody boolean existsCity(
			@PathVariable("country") String countryCode,
			@PathVariable("city") String cityName) {
		City city=cityRepo.getCityFromNameAndCountry(cityName, countryCode);
		if(city!=null) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/{id}/get_city_by_id",method=RequestMethod.GET)
	public @ResponseBody City getCityFromId(
			@PathVariable("id") Long id) {
		City city = cityRepo.findOne(id);
		if(city!=null) {
			return city;
		}
		return new City();
	}
	
	@RequestMapping(value="/{city}/update_city",method=RequestMethod.GET)
	public @ResponseBody boolean updateCity(
			@PathVariable("city") String jsonCity) {
		City city=new City();
		try {
			city = new ObjectMapper().readValue(jsonCity, City.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(city==new City()) {
			return false;
		}
		if(city.getId()==0) {
			city.setId(null);
		}
		city=cityRepo.save(city);
		if(city!=null) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/{id}/delete_city_by_id",method=RequestMethod.GET)
	public @ResponseBody boolean deleteCity(
			@PathVariable("id") Long id) {
		cityRepo.delete(id);
		if(cityRepo.findOne(id)!=null) {
			return false;
		}
		return true;
	}
}
