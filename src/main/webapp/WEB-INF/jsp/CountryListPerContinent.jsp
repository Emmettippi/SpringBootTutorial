<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista delle nazioni del continente ${continent}</title>
</head>
<body>
	<p><a href="home">Torna alla home</a></p>
	<p>Il continente ${continent} possiede le seguenti nazioni:</p>
	<table>
		<c:forEach items="${countryList}" var="riga">
			<tr>
				<td>
					<a href="show_city_list_per_country?countryCode=${riga.code}&countryName=${riga.name}">${riga.name}</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>