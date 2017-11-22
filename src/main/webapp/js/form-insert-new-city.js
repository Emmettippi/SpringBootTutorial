function validateForm(){
	var error=false;
	var cityname = $("#cityName").val();
	$("#cityNameWarning").hide();
	$("#cityPopulationWarning").hide();
	$("#cityDistrictWarning").hide();
	if(cityname==undefined || cityname.trim()==''){
		$("#cityNameWarning").show();
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
		$("form").submit();
	}
}