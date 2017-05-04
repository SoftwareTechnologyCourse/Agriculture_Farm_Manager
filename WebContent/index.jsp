<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome In our web site</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/calendrier.css" rel="stylesheet" type="text/css"
	media="screen" />
<script src="code_js/calendar.js" type="text/javascript"></script>
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<h1>Welcome In our web site</h1>
	<br />
	<h3>
		Clic <a href="se connecter.jsp">here</a> to connect
	</h3>
	<%@ include file="menu.jsp"%>
	<%@ include file="pied.jsp"%>
</body>
</html>
