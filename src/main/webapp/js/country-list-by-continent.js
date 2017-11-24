function setCountryListByContinent(continent,data){
	var countryList = "";
	countryList+= "<p>Il continente "+continent+" possiede le seguenti nazioni:</p>";
	countryList+="<button onclick='javascript:getContinentList()'>Torna indietro</button>";
	countryList+="<ul>";
	for(var i=0;i<data.length;i++){
		countryList+="<li><a href='javascript:getCityListByCountry(\""+continent+"\","+JSON.stringify(data[i])+")'>"+data[i].name+"</a></li>";
	}
	countryList+="</ul>";
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