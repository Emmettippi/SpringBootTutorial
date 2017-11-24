package it.objectmethod.world.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import it.objectmethod.world.model.Country;
import it.objectmethod.world.repo.CountryRepository;

@RestController
@RequestMapping("/api/country")
public class CountryRestController {

	@Autowired
	private CountryRepository countryRepo;
	
	@RequestMapping("/show_continent_list")
	public @ResponseBody List<String> home() {
		List<String> continentList = countryRepo.getAllContinent() ;
		return continentList;
	}
	
	@RequestMapping(value="/{continent}/show_country_list",method=RequestMethod.GET)
	public @ResponseBody List<Country> showCountryListPerContinent(
			@PathVariable("continent") String continent) {
		List<Country> countryList = countryRepo.getCountryListFromContinent(continent);
		return countryList;
	}
	
	@RequestMapping("/get_country_list")
	public @ResponseBody List<Country> getAllCountry(){
		return countryRepo.findAll(new Sort("Name"));
	}
	
	@RequestMapping(value="{countryCode}/get_country_by_id",method=RequestMethod.GET)
	public @ResponseBody Country getCountryById(
			@PathVariable("countryCode") String countryCode){
		return countryRepo.findOne(countryCode);
	}
}
