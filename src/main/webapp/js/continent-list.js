function setContinentList(data){
	var continentList="<ul>";
	for(var i=0;i<data.length;i++){
		continentList+="<li><a href='javascript:getCountryListByContinent(\""+data[i]+"\")'>"+data[i]+"</a></li>";
	}
	continentList+="</ul>";
	return continentList;
}

function getContinentList(){
	$.ajax({
		url: "/world/api/country/show_continent_list",
		type: "GET"
	}).done(function(continentList){
		$("#output").html(setContinentList(continentList));
	});
}

$(document).ready(function () {
	getContinentList();
});