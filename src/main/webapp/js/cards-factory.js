function getContinentCard(continent){
	return "<div class='col-lg-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			"<a href='javascript:getCountryListByContinent(\""+
			continent+
			"\")' class='card-link'>"+
			continent+
			"</a>" +
			"</h4>" +
			"</div>" +
			"</div>" +
			"</div>";
}

function getCountryCard(continent,country){
	return "<div class='col-md-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			"<a href='javascript:getCityListByCountry(\""+
			continent+
			"\","+
			JSON.stringify(country)+
			")' class='card-link'>"+
			country.name+
			"</a>" +
			"</h4>" +
			"<p>"+country.code+"</p>" +
			"</div>" +
			"</div>" +
			"</div>";
}

function getCityCard(continent,country,city){
	return "<div class='col-md-4'>" +
			"<div class='card bg-light'>" +
			"<div class='card-body'>" +
			"<h4 class='card-title'>" +
			city.name +
			"</h4>" +
			"<p>"+city.population+" abitanti</p>" +
			"<p>"+city.district+" ("+country.code+")</p>" +
			"<a href='form_insert_city?id=" + city.id +
			"' class='btn btn-primary'>Modifica</a>" +
			"<a class='btn btn-danger' " +
			"data-toggle='modal' " +
			"href='#cityModal" + city.id +
			"'>Cancella</a>" +
			"</div>" +
			"</div>" +
			"</div>" +
			"<div class='modal fade' id='cityModal"+city.id+"' role='dialog'>" +
			"<div class='modal-dialog'>" +
			"<div class='modal-content'>" +
			"<div class='modal-header'>" +
			"<h4 class='modal-title'>Sei sicuro di voler eliminare la citt&#224 di " + city.name + "?</h4>" +
			"</div>" +
			"<div class='modal-footer'>" +
			"<a class='btn btn-danger' href='javascript:delCity(\""+continent+"\"," +
			JSON.stringify(country) +
			",\"" + city.id + "\")'>S&#236</a>" +
			"<a class='btn btn-primary' data-dismiss='modal'>No</a>" +
			"</div>" +
			"</div>" +
			"</div>" +
			"</div>";
}