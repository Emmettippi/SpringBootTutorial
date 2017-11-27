function validateForm(id){
	var error=false;
	$(".warning").hide();
	var cityname = $("#cityName").val();
	if(cityname==undefined || cityname.trim()==''){
		$("#cityNameWarning").show();
		error=true;
	}
	var countrycode = $("#countryCode").find(":selected").val();
	if(countrycode==undefined || countrycode.trim()==''){
		$("#countryWarning").show();
		error=true;
	}
	var citypop = $("#cityPopulation").val();
	if(citypop==undefined || citypop.trim()=='' || isNaN(citypop)){
		$("#cityPopulationWarning").show();
		error=true;
	}
	var citydis = $("#cityDistrict").val();
	if(citydis==undefined || citydis.trim()==''){
		$("#cityDistrictWarning").show();
		error=true;
	}
	if(!error){
		$.ajax({
			url: "/world/api/city/"+countrycode+"/"+cityname+"/exists_city",
			type: "GET"
		}).done(function(cityExists){
			if(cityExists && id==0){
				$("#cityAndCountryWarning").show();
				error=true;
			}
			if(!error){
				$(".errorMessage").hide();
				var city=newCity();
				$.ajax({
					url:"/world/api/country/"+countrycode+"/get_country_by_id",
					type:"GET"
				}).done(function(_country){
					city.country=_country;
					city.id=id;
					city.name=cityname.trim();
					city.population=citypop.trim();
					city.district=citydis.trim();
					$.ajax({
						url:"/world/api/city/"+JSON.stringify(city)+"/update_city",
						type:"GET"
					}).done(function(result){
						if(result){
							alert("Operazione eseguita con successo.");
							window.location.href="home";
						}
						else{
							alert("Operazione annullata, qualcosa &#232 andato storto.");
						}
					});
				});
			}
		});
	}
}

function delCity(continent,country,id){
	$.ajax({
		url:"/world/api/city/"+id+"/delete_city_by_id",
		type: "GET"
	}).done(function(result){
		if(result){
			alert("Eliminazione eseguita con successo.");
		}
		else{
			alert("Operazione annullata, qualcosa &#232 andato storto.");
		}
		getCityListByCountry(continent,country);
	});
}
