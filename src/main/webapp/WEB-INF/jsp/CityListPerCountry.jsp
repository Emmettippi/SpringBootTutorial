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
	<p><a href="home">Torna alla home</a></p>
	<p>La nazione ${countryName} possiede le seguenti città e relativa popolazione</p>
	<table>
	<tr>
		<th>Nome Città</th>
		<th>Popolazione</th>
	</tr>
		<c:forEach items="${cityList}" var="riga">
			<tr>
				<td>${riga.name}</td>
				<td>${riga.population}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>