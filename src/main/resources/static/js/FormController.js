
function isValidateForm(){
	return (isValideString($("#cityName").val()) && isValideString($("#cityDistrict").val()) && $("#cityPopulation").val().isNumeric());
};

function isValideNumChar(ch){
	return (ch >= '0' && ch <= '9');
};

function isValideString(txt){
	return (txt!=null && txt.trim()!="");
};

function setDefaultCityName(){
	if("${result.success}"==false){
		$("#cityName").val("${cityName}");
	}
	else{
		$("#cityName").val("");
	}
};

function setDefaultCityPopulation(){
	if("${result.success}"==false){
		$("#cityPopulation").val("${cityPopulation}");
	}
	else{
		$("#cityPopulation").val("");
	}
};

function setDefaultCityDistrict(){
	if("${result.success}"==false){
		$("#cityDistrict").val("${cityDistrict}");
	}
	else{
		$("#cityDistrict").val("");
	}
};

$(document).ready(function(){
	setDefaultCityName();
	setDefaultCityPopulation();
	setDefaultCityDistrict();
	$("input").focus(function(){
		$(this).css("background-color", "#cccccc");
	});
	$("input").blur(function(){
		$(this).css("background-color", "#ffffff");
	});
	$("#cityName").keypress(function(){
		if(isValideString($(this).val())){
			$("#cityNameWarning").hide();
		}
		else{
			$("#cityNameWarning").show();
		}
	});
	$("#cityDistrict").keypress(function(){
		if(isValideString($(this).val())){
			$("#cityDistrictWarning").hide();
		}
		else{
			$("#cityDistrictWarning").show();
		}
	});
	$("#cityPopulation").keypress(function(){
		if($.isNumeric($("#cityPopulation").val())){
			$("#cityPopulationWarning").hide();
		}
		else{
			$("#cityPopulationWarning").show();
		}
	});
	$("#cityPopulation").keydown(function(ch){
		if (isValideNumChar(ch)) {
			ch.preventDefault();
		}
	});
	$("form").submit(function(event){
		if(isValideForm()){
			event.preventDefault();
		}
	});
});