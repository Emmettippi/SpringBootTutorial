package it.objectmethod.world;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import it.objectmethod.world.model.City;
import it.objectmethod.world.repo.CityRepository;

@Controller
public class WelcomeController {
/*
	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "Hello World";
	
	@Autowired
	private HelloWorld helloMessage;
	
	@Autowired
	private CityRepository cityRepo;

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		City city = cityRepo.findOne(2L);
		model.put("message", city.getName());
		return "welcome";
	}
*/
}