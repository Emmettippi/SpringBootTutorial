function setCityListByConuntry(continent,country,data){
	var cityList="";
	cityList+="<p>La nazione "+country.name+" possiede le seguenti citt&#224 e relativa popolazione</p>";
	cityList+="<button onclick='javascript:getCountryListByContinent(\""+continent+"\")'>Torna indietro</button>";
	cityList+="<table>";
	cityList+="<tr>";
	cityList+="<th>Nome Citt&#224</th>";
	cityList+="<th>Popolazione</th>";
	cityList+="<th>Modifica</th>";
	cityList+="<th>Elimina</th>";
	cityList+="</tr>";
	for(var i=0;i<data.length;i++){
		cityList+="<tr>";
		cityList+="<td>"+data[i].name+"</td>";
		cityList+="<td>"+data[i].population+"</td>";
		cityList+="<td><button onclick=\"window.location.href='form_insert_city?id="+data[i].id+"'\" class='edit'></button></td>";
		cityList+="<td><button onclick='javascript:delCity(\""+continent+"\","+JSON.stringify(country)+",\""+data[i].id+"\")' class='delete'></button></td>";
		cityList+="</tr>";
	}
	cityList+="</table>";
	return cityList;
}

function getCityListByCountry(continent,country){
	$.ajax({
		url: "/world/api/city/"+country.code+"/show_city_list",
		type: "GET"
	}).done(function(data){
		$("#output").html(setCityListByConuntry(continent,country,data));
	});
}