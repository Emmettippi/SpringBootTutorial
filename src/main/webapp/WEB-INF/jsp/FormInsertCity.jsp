<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Aggiorna citt&#224</title>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/form-insert-city.js"></script>
	<script type="text/javascript" src="js/model.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<!-- BOOTSTRAP -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>
	<h2>Tutti i campi sono obbligatori!</h2>
	<h3 class='errorMessage'>Inserisci correttamente tutti i parametri</h3>
	<p>Nome della citt&#224: <input type="text" id="cityName" name="cityName" size="20px" value="${city.name}">
	</p>
	<p id="cityNameWarning" class="warning">*Il nome della citt&#224
		&#232 un campo obbligatorio.</p>
	<br>
	<p>Nazione: <select id="countryCode" name="countryCode">
			<option></option>
			<c:forEach items="${countryList}" var="_country">
				<option value="${_country.code}" ${_country.code==city.country.code ? 'selected' : '' }>${_country.name}</option>
			</c:forEach>
		</select>
	</p>
	<p id='cityAndCountryWarning' class='warning'>Esiste già una città con quel nome in questa nazione!</p>
	<br>
	<p>Popolazione: <input type="number" id="cityPopulation" name="cityPopulation" size="20px" value="${city.population}">
	</p>
	<p id="cityPopulationWarning" class="warning">*La popolazione &#232 un campo obbligatorio.</p>
	<br>
	<p>Regione: <input type="text" id="cityDistrict" name="cityDistrict" size="20px" value="${city.district}">
	</p>
	<p id="cityDistrictWarning" class="warning">*Il nome della regione &#232 un campo obbligatorio.</p>
	<br>
	<br>
	<button onclick="javascript:validateForm(${city.id})">Conferma</button>
	<br>
	<p><a href="home">Clicca qui</a> per tornare alla home</p>
</body>

</html>