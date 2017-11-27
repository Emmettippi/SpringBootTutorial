<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ajax World Project</title>
	
	<!-- CSS -->
	<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	
	<!-- JS -->
	<script src="js/jquery/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/edit-city.js"></script>
	<script type="text/javascript" src="js/continent-list.js"></script>
	<script type="text/javascript" src="js/country-list-by-continent.js"></script>
	<script type="text/javascript" src="js/city-list-by-country.js"></script>
	<script type="text/javascript" src="js/model.js"></script>
	<script type="text/javascript" src="js/cards-factory.js"></script>
	
</head>
<body>
	<div class="jumbotron">
		<h1>AJAX BOOTSTRAP WORLD PROJECT</h1>
		<p>Con l'aggiunta dei magici css di bootstrap</p>
	</div>
	<a href="form_insert_city?id=0" class="custom-insert-city-btn btn btn-info">Inserisci una nuova citt&#224</a><br><br>
	<div class="container custom-container" id="theContainer"></div>
</body>
</html>