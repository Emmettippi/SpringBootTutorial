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
	<c:if test="${!empty result.success}">
		<h2>
			<c:out value="${result.message}"/>
		</h2>
		<br>
	</c:if>
	<h3>Inserisci una nuova città</h3>
	<h4>Tutti i campi sono obbligatori!</h4>
	<form action="form_insert_new_city">
		Nome della città: <c:choose>
			<c:when test="${result.success==false}">
				<input type="text" name="cityName" size="20px"value="${cityName}">
			</c:when>
			<c:otherwise>
				<input type="text" name="cityName" size="20px" value="">
			</c:otherwise>
		</c:choose>
		<br>
		Nazione: <select name="countryCode">
			<c:forEach items="${countryList}" var="country">
				<option value="${country.code}">${country.name}</option>
			</c:forEach>
		</select>
		<br>
		Popolazione: <c:choose>
			<c:when test="${result.success==false}">
				<input type="text" name="cityPopulation" size="20px" value="${cityPopulation}">
			</c:when>
			<c:otherwise>
				<input type="text" name="cityPopulation" size="20px" value="">
			</c:otherwise>
		</c:choose>
		<br>
		Distretto: <c:choose>
			<c:when test="${result.success==false}">
				<input type="text" name="cityDistrict" size="20px" value="${cityDistrict}">
			</c:when>
			<c:otherwise>
				<input type="text" name="cityDistrict" size="20px" value="">
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<input type="submit" value="Conferma inserimento">
	</form>
	<br>
	<p><a href="home">Clicca qui</a> per tornare alla home</p>
</body>
</html>