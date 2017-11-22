<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Inserisci nuova citt&#224</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<!-- <script type="text/javascript" th:src="@{js/FormController.js}"></script> -->
			<script>
				function validateForm(){
					var error=false;
					var cityname = $("#cityName").val();
					$("#cityNameWarning").hide();
					$("#cityPopulationWarning").hide();
					$("#cityDistrictWarning").hide();
					if(cityname==undefined || cityname.trim()==''){
						$("#cityNameWarning").show();
						error=true;
					}
					var citypop = $("#cityPopulation").val();
					if(citypop==undefined || citypop.trim()=='' || isNaN(citypop)){
						$("#cityPopulationWarning").show();
						error=true;
					}
					var citydis = $("#cityDistrict").val();
					if(citydis==undefined || citydis.trim()==''){
						$("#cityDistrictWarning").show();
						error=true;
					}
					if(!error){
						$("form").submit();
					}
				}
			</script>
		</head>

		<body>
			<c:if test="${!empty result.success}">
				<h2>
					<c:out value="${result.message}" />
				</h2>
				<br>
			</c:if>
			<h3>Inserisci una nuova citt&#224</h3>
			<h4>Tutti i campi sono obbligatori!</h4>
			<form action="form_insert_new_city">
				Nome della citt&#224:
				<input type="text" id="cityName" name="cityName" size="20px">
				<p id="cityNameWarning" style="display:none;color:red;font-size:75%;">*Il nome della citt&#224 &#232 un campo obbligatorio.</p>
				<br> Nazione:
				<select id="countryCode" name="countryCode" onchange="">
					<c:forEach items="${countryList}" var="country">
						<option value="${country.code}">${country.name}</option>
					</c:forEach>
				</select>
				<br> Popolazione:
				<input type="number" id="cityPopulation" name="cityPopulation" size="20px">
				<p id="cityPopulationWarning" style="color:red;font-size:75%;display:none;">*La popolazione &#232 un campo obbligatorio.</p>
				<br> Regione:
				<input type="text" id="cityDistrict" name="cityDistrict" size="20px">
				<p id="cityDistrictWarning" style="color:red;font-size:75%;display:none;">*Il nome della regione &#232 un campo obbligatorio.</p>
				<br>
				<br>
				<input type="button" value="Conferma inserimento" onclick="javascript:validateForm()">
			</form>
			<br>
			<p>
				<a href="home">Clicca qui</a> per tornare alla home</p>
		</body>

		</html>