function setCountryListByContinent(continent,data){
	var countryList = "";
	countryList+="<p>" +
			"<a class='btn btn-info' href='javascript:getContinentList()'>Indietro</a> " +
			"Il continente <b>" +
			continent +
			"</b> possiede le seguenti nazioni:</p>";
	countryList+="<div class='row'>";
	for(var i=0;i<data.length;i++){
		countryList+=getCountryCard(continent,data[i]);
	}
	countryList+="</div>";
	return countryList;
}

function getCountryListByContinent(continent){
	$.ajax({
		url: "/world/api/country/"+continent+"/show_country_list",
		type: "GET"
	}).done(function(data){
		$("#theContainer").html(setCountryListByContinent(continent,data));
	});
}