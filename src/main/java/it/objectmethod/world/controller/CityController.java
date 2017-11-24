package it.objectmethod.world.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import it.objectmethod.world.model.City;
import it.objectmethod.world.model.Country;
import it.objectmethod.world.model.OperationResult;
import it.objectmethod.world.repo.CityRepository;
import it.objectmethod.world.repo.CountryRepository;

@Controller
public class CityController {

	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CityRepository cityRepo;

	@Autowired
	private CountryRepository countryRepo;

	@RequestMapping("/show_city_list_per_country")
	public String showCityListPerCountry(ModelMap model,
			@RequestParam("countryCode") String countryCode,
			@RequestParam("countryName") String countryName) {
		List<City> cityList = cityRepo.getCityListFromCountry(countryCode);
		model.put("countryName", countryName);
		model.put("cityList", cityList);
		return "CityListPerCountry";
	}

	@RequestMapping(value="/form_insert_city",method=RequestMethod.GET)
	public String formInsertNewCity(ModelMap model,
			@RequestParam("id") Long id) {
		if(id==0) {
			City city=new City();
			city.setId(id);
			model.put("city", city);
		}else {
			model.put("city", cityRepo.findOne(id));
		}
		List<Country> countryList = countryRepo.findAll(new Sort("Name"));
		model.put("countryList", countryList);
		return "FormInsertCity";
	}
}
