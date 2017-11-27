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
	<script type="text/javascript" src="js/Cards.js"></script>
	<script type="text/javascript" src="js/Pagination.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<!-- BOOTSTRAP -->
	<script type="text/javascript" src="js/tether.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<link href="css/tether.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="jumbotron">
		<h1>AJAX BOOTSTRAP WORLD PROJECT</h1>
		<p>Con l'aggiunta dei magici css di bootstrap</p>
	</div>
	<a href="form_insert_city?id=0" class="btn btn-info">Inserisci una nuova citt&#224</a><br>
	<div class="container-fluid" id="theContainer"></div>
</body>
</html>