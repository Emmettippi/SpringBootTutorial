package it.objectmethod.world.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

	@Autowired
	private CityRepository cityRepo;

	@Autowired
	private CountryRepository countryRepo;

	@RequestMapping("/show_city_list_per_country")
	public String showCityListPerCountry(Map<String, Object> model,
			@RequestParam("countryCode") String countryCode,
			@RequestParam("countryName") String countryName) {
		//System.out.println("Almeno prima della query ci arriva?");
		List<City> cityList = cityRepo.getCityListFromCountry(countryCode);
		//System.out.println("Almeno dopo la query ci arriva?");
		/*
		City c = new City();
		c.setName("Busto arsizio");
		c = cityRepo.save(c);
		 */
		model.put("countryName", countryName);
		model.put("cityList", cityList);
		return "CityListPerCountry";
	}

	@RequestMapping("/insert_new_city")
	public String insertNewCity(Map<String, Object> model) {
		List<Country> cntList = countryRepo.findAll(new Sort("Name"));
		model.put("countryList", cntList);
		return "InsertNewCity";
	}

	@RequestMapping("/confirm_action")
	public String checkNewCity(ModelMap model,
			@RequestParam("cityName") String cityName,
			@RequestParam("countryCode") String countryCode,
			@RequestParam("cityPopulation") String cityPopulation,
			@RequestParam("cityDistrict") String cityDistrict) {
		OperationResult res=new OperationResult();
		res.setSuccess(true);
		res.setMessage(OperationResult.SUCCESS);
		
		City newCity = new City();

		if(cityName == null
				|| cityName.trim().equals("")) {
			res.setSuccess(false);
			res.setMessage("Inserire una città valida.");
		} else {
			newCity.setName(cityName.trim());
		}
		
		if(cityDistrict.equals("")) {
			error.setCityDistrict(true);
		}
		newCity.setDistrict(cityDistrict);
		try {
			newCity.setPopulation(Long.parseLong(cityPopulation));
		}catch(Exception e) {
			e.printStackTrace();
			error.setCityPopulation(true);
		}
		newCity.setCountry(countryRepo.findOne(countryCode));
		if(newCity.getCountry().getCode().equals("")) {
			error.setCityCountry(true);
		}
//		List<City> cityList = cityRepo.findAll();
//		error.setCityNameAlreadyExists(false);
//		for(int i=0;i<cityList.size();i++) {
//			if(cityList.get(i).getName().equals(cityName)) {
//				error.setCityNameAlreadyExists(true);
//			}
//		}
		
		City checkCity = cityRepo.getCityFromName(name);
		if(checkCity != null) {
			res.setSuccess(false);
			res.setMessage("Città già presente.");
		}
		
		if(res.isSuccess()) {
			cityRepo.save(newCity);
		}
		
		model.put("result", res);
		return "CityInsertResult";
//		if(error.cityAtLeastOneError()) {
//			model.put("cityName", cityName);
//			model.put("cityPopulation", cityPopulation);
//			model.put("cityDistrict", cityDistrict);
//			model.put("error", error);
//			return insertNewCity(model);
//		}
//		else {
//			
//			return "CorrectOperation";
//		}
	}
}
