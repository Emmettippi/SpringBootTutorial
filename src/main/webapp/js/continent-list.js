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
	}).done(function(data){
		$("#theContainer").html(setContinentList(data));
	});
}

$(document).ready(function () {
	getContinentList();
});