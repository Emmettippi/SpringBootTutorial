function setCityListByConuntry(continent,country,data){
	var cityList="";
	cityList+="<p>" +
			"<a class='btn btn-info' href='javascript:getCountryListByContinent(\""+continent+"\")'>Indietro</a> " +
			"La nazione <b>" +
			country.name +
			"</b> possiede le seguenti citt&#224:</p>";
	cityList+="<div class='row'>";
	for(var i=0;i<data.length;i++){
		cityList+=getCityCard(continent,country,data[i]);
	}
	cityList+="</div>";
	return cityList;
}

function getCityListByCountry(continent,country){
	$.ajax({
		url: "/world/api/city/"+country.code+"/show_city_list",
		type: "GET"
	}).done(function(data){
		$("#theContainer").html(setCityListByConuntry(continent,country,data));
	});
}