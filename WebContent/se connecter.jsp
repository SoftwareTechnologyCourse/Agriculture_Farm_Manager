<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authentication</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/calendrier.css" rel="stylesheet" type="text/css"
	media="screen" />
<script src="code_js/calendar.js" type="text/javascript"></script>
</head>
<body>
	<form method="post" action="connexion">
		<%@ include file="en_tete.jsp"%>
		<H1 align="center">Member Access</H1>
		<br>
		<div>
			<table align="center" style="width: 500px; height: 106px">
				<tr align="justify">
					<td bgcolor="Gray" colspan="4">&nbsp;</td>
				</tr>

				<tr align="justify">
					<td bgcolor="Silver" rowspan="2">Log-In:</td>
					<td bgcolor="Silver">User Name<span id="lblSubMessage"
						class="red" style="color: #CC3300;"></span>
					</td>
					<td><input name="login" type="text" maxlength="20"
						style="color: Black; background-color: White; border-color: White; border-style: Inset; height: 20px; width: 150px;" />
						&nbsp;&nbsp; <br /></td>
					<td></td>
				</tr>
				<tr align="justify">
					<td bgcolor="Silver">Password:<span id="lblSubMessage0"
						class="red" style="color: #CC3300;"></span>

					</td>
					<td><input name="password" type="password" maxlength="20"
						style="color: Black; background-color: White; border-color: White; border-style: Inset; height: 20px; width: 150px;" />
					</td>
					<td><input type="submit" name="connect" value="Login"
						style="color: Black; border-color: #669900; border-style: Groove; height: 22px; width: 147px;" />
					</td>
				</tr>
				<tr align="justify">

					<td bgcolor="Gray" colspan="4">&nbsp;</td>
				</tr>
			</table>
		</div>

		<%@ include file="menu.jsp"%>
		<%@ include file="pied.jsp"%>
	</form>
</body>
</html>