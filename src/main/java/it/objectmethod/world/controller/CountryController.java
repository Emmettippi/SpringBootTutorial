package it.objectmethod.world.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.objectmethod.world.model.Country;
import it.objectmethod.world.repo.CountryRepository;

@Controller
public class CountryController {

	@Autowired
	private CountryRepository countryRepo;
	
	@RequestMapping("/home")
	public String home(ModelMap model) {
		List<String> continentList = countryRepo.getAllContinent() ;
		model.put("continentList", continentList);
		return "home";
	}

	@RequestMapping("/show_country_list_per_continent")
	public String showCountryListPerContinent(Map<String, Object> model,
			@RequestParam("continent") String continent) {
		List<Country> countryList = countryRepo.getCountryListFromContinent(continent);
		model.put("continent", continent);//superfluo?
		model.put("countryList", countryList);
		return "CountryListPerContinent";
	}
}
