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
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value="/form_insert_new_city")
	public String formInsertNewCity(ModelMap model) {
		List<Country> cntList = countryRepo.findAll(new Sort("Name"));
		model.put("countryList", cntList);
		return "FormInsertNewCity";
	}
	
	@RequestMapping(value="/form_insert_new_city",
			params= {"cityName",
					"countryCode",
					"cityPopulation",
					"cityDistrict"})
	public String formCheckInsertNewCity(ModelMap model,
			@RequestParam("cityName") String cityName,
			@RequestParam("countryCode") String countryCode,
			@RequestParam("cityPopulation") String cityPopulation,
			@RequestParam("cityDistrict") String cityDistrict) {
		OperationResult res=new OperationResult();
		res.setSuccess(true);
		res.setMessage(OperationResult.SUCCESS);
		
		City newCity = new City();
		
		if(cityName == null || cityName.trim().equals("")) {
			res.setSuccess(false);
			res.setMessage(OperationResult.INSUCCESS);
		}
		else {
			newCity.setName(cityName.trim());
		}
		
		if(cityDistrict == null || cityDistrict.trim().equals("")) {
			res.setSuccess(false);
			res.setMessage(OperationResult.INSUCCESS);
		}
		else {
			newCity.setDistrict(cityDistrict.trim());
		}
		
		newCity.setDistrict(cityDistrict);
		try {
			newCity.setPopulation(Long.parseLong(cityPopulation));
		}catch(Exception e) {
			log.error("Errore di parseLong: ",e);
			res.setSuccess(false);
			res.setMessage(OperationResult.INSUCCESS);
		}
		newCity.setCountry(countryRepo.findOne(countryCode));
		
		City checkCity = cityRepo.getCityFromNameAndCountry(newCity.getName(),newCity.getCountry().getCode());
		if(checkCity != null) {
			res.setSuccess(false);
			res.setMessage("Città già presente.");
		}
		
		if(res.isSuccess()) {
			cityRepo.save(newCity);
		}
		model.put("cityName", cityName.trim());
		model.put("cityDistrict", cityDistrict.trim());
		model.put("cityPopulation", cityPopulation.trim());
		model.put("result", res);
		
		return formInsertNewCity(model);
	}
}
