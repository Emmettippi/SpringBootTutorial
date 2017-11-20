<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserisci nuova città</title>
</head>
<body>
	<h2>Inserisci una nuova città</h2>
	<h4>Tutti i campi sono obbligatori!</h4>
	<form action="confirm_action">
		Nome della città: <input type="text" name="cityName" size="20px" value="${cityName}"><br>
		<c:if test="${error.cityName==true}">
			<p style="color: red; font-size: 80%;">* Il nome della città è un campo obbligatorio</p>
			<br>
		</c:if>
		<c:if test="${error.cityNameAlreadyExists==true}">
			<p style="color: red; font-size: 80%;">* la città selezionata esiste già</p>
			<br>
		</c:if>
		Nazione: <select name="countryCode">
			<c:forEach items="${countryList}" var="country">
				<option value="${country.code}">${country.name}</option>
			</c:forEach>
		</select><br>
		Popolazione: <input type="text" name="cityPopulation" size="20px" value="${cityPopulation}"><br>
		<c:if test="${error.cityPopulation==true}">
			<p style="color: red; font-size: 80%;">* Inserisci un valore valido</p>
			<br>
		</c:if>
		Distretto: <input type="text" name="cityDistrict" size="20px"  value="${cityDistrict}"><br>
		<c:if test="${error.cityDistrict==true}">
			<p style="color: red; font-size: 80%;">* Il nome del distretto è un campo obbligatorio</p>
			<br>
		</c:if>
		<br>
		<br> <input type="submit" value="Conferma inserimento">
	</form>
	<br>
	<p><a href="home">Clicca qui</a> per annullare l'operazione e tornare alla home</p>
</body>
</html>