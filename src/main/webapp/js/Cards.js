function getContinentCard(continent){
	return "<div class='col-sm-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			"<a href='javascript:getCountryListByContinent(\""+
			continent+
			"\")'' class='card-link'>"+
			continent+
			"</a>" +
			"</h4>" +
			"</div>" +
			"</div>" +
			"</div>";
}

function getCountryCard(continent,country){
	return "<div class='col-sm-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			"<a href='javascript:getCityListByCountry(\""+
			continent+
			"\","+
			JSON.stringify(country)+
			"\")'' class='card-link'>"+
			country.name+
			"</a>" +
			"</h4>" +
			"<p>"+country.code+"</p>" +
			"</div>" +
			"</div>" +
			"</div>";
}

function getCityCard(continent,country,city){
	return "<div class='col-sm-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			city.name +
			"</h4>" +
			"<p>"+city.population+" abitanti</p>" +
			"<p>"+city.district+" ("+country.id+")</p>" +
			"<a href='javascript:form_insert_city?id="+
			city.id+
			"' class='btn btn-primary'>Modifica</a>" +
			"<a href='javascript:delCity(\"" +
			continent+"\","+JSON.stringify(country)+",\""+city.id +
			"\")' class='btn btn-danger' " +
			"data-toggle='confirmation' " +
			"data-singleton='true' " +
			"data-popout='true' " +
			"data-title='Sei sicuro di voler cancellare " +city.name
			"?'>Cancella</a>" +
			"</div>" +
			"</div>" +
			"</div>";
}