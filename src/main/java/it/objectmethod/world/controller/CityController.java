package it.objectmethod.world.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.objectmethod.world.model.City;
import it.objectmethod.world.repo.CityRepository;

@Controller
public class CityController {

	@Autowired
	private CityRepository cityRepo;

	@RequestMapping("/show_city_list_per_country")
	public String showCityListPerCountry(Map<String, Object> model,@RequestParam("countryCode") String countryCode) {
		List<City> cityList = cityRepo.getCityListFromCountry(countryCode) ;
		model.put("message", cityList);
		return "CityListPerCountry";
	}
}
