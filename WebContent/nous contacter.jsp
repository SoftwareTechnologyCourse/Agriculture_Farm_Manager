<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>

<link href="css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/calendrier.css" rel="stylesheet" type="text/css"
	media="screen" />
<script src="code_js/calendar.js" type="text/javascript"></script>
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<h1>To contact us</h1>
	<center>
		<form>
			<table
				style="background-color: White; border-width: 1px; border-style: None; width: 500px;">
				<tr
					style="color: black; background-color: green; font-weight: bold;">
					<th>Name</th>
					<th>Prenoun</th>
					<th>Email</th>
					<th>Phone N</th>
				</tr>
				<tr>
					<th>GUESMI</th>
					<th>Karim</th>
					<th>karim_poste@yahoo.fr</th>
					<th>0021625677744</th>
				</tr>
				<tr>
					<th>Hamza</th>
					<th>Ahmed</th>
					<th>Hamza@live.fr</th>
					<th></th>
				</tr>
				<tr>
					<th>Kaddachi</th>
					<th>Oussama</th>
					<th>oussama@outlook.com</th>
					<th></th>
				</tr>
				<tr>
					<th>Imad</th>
					<th>Leghlam</th>
					<th>imad@gmail.com</th>
					<th></th>
				</tr>
			</table>
		</form>
	</center>
	<%@ include file="menu.jsp"%>
	<%@ include file="pied.jsp"%>
</body>
</html>