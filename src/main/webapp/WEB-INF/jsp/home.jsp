<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ajax World Project</title>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/form-insert-city.js"></script>
	<script type="text/javascript" src="js/continent-list.js"></script>
	<script type="text/javascript" src="js/country-list-by-continent.js"></script>
	<script type="text/javascript" src="js/city-list-by-country.js"></script>
	<script type="text/javascript" src="js/model.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>Ajax World Project</h1>
	<button onclick="window.location.href='form_insert_city?id=0'">Inserisci una nuova citt&#224</button><br>
	<div id="output"></div>
</body>
</html>