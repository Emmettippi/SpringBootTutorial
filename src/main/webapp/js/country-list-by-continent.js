function setCountryListByContinent(continent,data){
	var countryList = "";
	countryList+="<p>" +
			"<a class='btn btn-info' href='javascript:getContinentList()'>Indietro</a> " +
			"Il continente " +
			continent +
			" possiede le seguenti nazioni:</p>";
	countryList+="<div class='row'>";
	for(var i=0;i<data.length;i++){
		countryList+=getContinentCard(continent,data[i]);
	}
	countryList+="</div>";
	return countryList;
}

function getCountryListByContinent(continent){
	$.ajax({
		url: "/world/api/country/"+continent+"/show_country_list",
		type: "GET"
	}).done(function(data){
		$("#output").html(setCountryListByContinent(continent,data));
	});
}