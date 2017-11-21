<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserisci nuova città</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="FormController.js"></script> -->
<script>
$(document).ready(function(){
	function isValidateForm(){
		return (isValideString($("#cityName").val()) && isValideString($("#cityDistrict").val()) && $("#cityPopulation").val().isNumeric());
	};

	function isValideNumChar(ch){
		return (ch >= '0' && ch <= '9');
	};

	function isValideString(txt){
		return (txt!=null && txt.trim()!="");
	};

	function setDefaultCityName(){
		if("${result.success}"==false){
			$("#cityName").val("${cityName}");
		}
		else{
			$("#cityName").val("");
		}
	};

	function setDefaultCityPopulation(){
		if("${result.success}"==false){
			$("#cityPopulation").val("${cityPopulation}");
		}
		else{
			$("#cityPopulation").val("");
		}
	};

	function setDefaultCityDistrict(){
		if("${result.success}"==false){
			$("#cityDistrict").val("${cityDistrict}");
		}
		else{
			$("#cityDistrict").val("");
		}
	};
	
	setDefaultCityName();
	setDefaultCityPopulation();
	setDefaultCityDistrict();
	$("input").focus(function(){
		$(this).css("background-color", "#cccccc");
	});
	$("input").blur(function(){
		$(this).css("background-color", "#ffffff");
	});
	$("#cityName").keypress(function(){
		if(isValideString($(this).val())){
			$("#cityNameWarning").hide();
		}
		else{
			$("#cityNameWarning").show();
		}
	});
	$("#cityDistrict").keypress(function(){
		if(isValideString($(this).val())){
			$("#cityDistrictWarning").hide();
		}
		else{
			$("#cityDistrictWarning").show();
		}
	});
	$("#cityPopulation").keypress(function(){
		if($.isNumeric($("#cityPopulation").val())){
			$("#cityPopulationWarning").hide();
		}
		else{
			$("#cityPopulationWarning").show();
		}
	});
	$("#cityPopulation").keydown(function(ch){
		if (isValideNumChar(ch)) {
			ch.preventDefault();
		}
	});
	$("form").submit(function(event){
		if(isValideForm()){
			event.preventDefault();
		}
	});
});
</script>
</head>
<body>
	<c:if test="${!empty result.success}">
		<h2>
			<c:out value="${result.message}"/>
		</h2>
		<br>
	</c:if>
	<h3>Inserisci una nuova città</h3>
	<h4>Tutti i campi sono obbligatori!</h4>
	<form action="form_insert_new_city">
		Nome della città: <input type="text" id="cityName" name="cityName" size="20px">
		<p id="cityNameWarning" style="color:red;font-size:75%;visibility:hidden;">*Il nome della città è un campo obbligatorio</p>
		<br>
		Nazione: <select id="countryCode" name="countryCode" onchange="">
			<c:forEach items="${countryList}" var="country">
				<option value="${country.code}">${country.name}</option>
			</c:forEach>
		</select>
		<br>
		Popolazione: <input type="text" id="cityPopulation" name="cityPopulation" size="20px">
		<p id="cityPopulationWarning" style="color:red;font-size:75%;visibility:hidden;">*La popolazione è un campo obbligatorio</p>
		<br>
		Regione: <input type="text" id="cityDistrict" name="cityDistrict" size="20px">
		<p id="cityDistrictWarning" style="color:red;font-size:75%;visibility:hidden;">*Il nome della regione è un campo obbligatorio</p>
		<br>
		<br>
		<input type="submit" value="Conferma inserimento">
	</form>
	<br>
	<p><a href="home">Clicca qui</a> per tornare alla home</p>
</body>
</html>