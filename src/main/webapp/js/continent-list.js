function setContinentList(data){
	var continentList="";
	continentList+="<div class='row'>";
	for(var i=0;i<data.length;i++){
		continentList+=getContinentCard(data[i]);
	}
	continentList+="</div>";
	return continentList;
}

function getContinentList(){
	$.ajax({
		url: "/world/api/country/show_continent_list",
		type: "GET"
	}).done(function(continentList){
		$("#theContainer").html(setContinentList(continentList));
	});
}

$(document).ready(function () {
	getContinentList();
});