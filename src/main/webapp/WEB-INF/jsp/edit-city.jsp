<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Aggiorna citt&#224</title>
	<script src="js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/edit-city.js"></script>
	<script type="text/javascript" src="js/model.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<!-- BOOTSTRAP -->
	<script type="text/javascript" src="js/bootstrap/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap/tether.js"></script>
	<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
	<link href="css/bootstrap/tether.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="jumbotron">
		<h1>AJAX BOOTSTRAP WORLD PROJECT</h1>
		<p>Con l'aggiunta dei magici css di bootstrap</p>
	</div>
	<h2>Tutti i campi sono obbligatori!</h2>
	<h3 class='errorMessage'>Inserisci correttamente tutti i parametri</h3>
	<div class="form-group">
	<p>Nome della citt&#224: <input type="text" id="cityName" name="cityName" class="form-control form-input" value="${city.name}" placeholder="Nome Città">
	</p>
	<p id="cityNameWarning" class="warning">*Il nome della citt&#224 &#232 un campo obbligatorio.</p>
	</div>
	<div class="form-group">
	<p>Nazione: <select id="countryCode" name="countryCode">
			<option></option>
			<c:forEach items="${countryList}" var="_country">
				<option value="${_country.code}" ${_country.code==city.country.code ? 'selected' : '' }>${_country.name}</option>
			</c:forEach>
		</select>
	</p>
	</div>
	<div class="form-group">
	<p id='cityAndCountryWarning' class='warning'>Esiste già una città con quel nome in questa nazione!</p>
	<p>Popolazione: <input type="number" id="cityPopulation" name="cityPopulation" class="form-control" value="${city.population}" placeholder="Popolazione">
	</p>
	<p id="cityPopulationWarning" class="warning">*La popolazione &#232 un campo obbligatorio.</p>
	</div>
	<div class="form-group">
	<p>Regione: <input type="text" id="cityDistrict" name="cityDistrict" class="form-control" value="${city.district}" placeholder="Regione">
	</p>
	<p id="cityDistrictWarning" class="warning">*Il nome della regione &#232 un campo obbligatorio.</p>
	</div>
	<a href="javascript:validateForm(${city.id})" class='btn btn-primary'>Conferma</a>
	<br><br>
	<p><a  class='btn btn-info' href="home">Clicca qui</a> per tornare alla home</p>
</body>

</html>