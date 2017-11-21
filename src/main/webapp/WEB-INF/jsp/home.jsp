<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>BENVENUTO!!!</h2>
	<p>Ecco la lista dei continenti!</p>
	<ul>
		<c:forEach items="${continentList}" var="riga">
			<li><a href="show_country_list_per_continent?continent=${riga}">${riga}</a></li>
		</c:forEach>
	</ul><br><br>
	<p><a href="form_insert_new_city">Clicca qui</a> per inserire una nuova città</p>
</body>
</html>