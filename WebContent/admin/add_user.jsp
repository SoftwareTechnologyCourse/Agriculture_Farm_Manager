<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script  type="text/javascript" src="js/add_user.js"></script>

<title>Add User</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>

	<%@ include file="en_tete.jsp"%>
	<form name="f" action="ajouter_ouvrier.jsp" METHOD="post"
		onsubmit="return verifier_formulaire()">
		<H1>Add user's information</H1>

		<table width="500">
			<tr>
				<td bgcolor="#669999" colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td bgcolor="#669000">Add User</td>

				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>User ID</td>
				<td><input name="id" type="text" style="width: 238px;" /> <span
					id="Scode1" style="color: Red; display: none;">Enter correct
						data</span></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input name="mdp1" type="password"
					onblur="verifier_mdp1(this)" style="width: 238px;" /> <label
					id="md" style="color: Red; visibility: hidden; position: auto;">Min
						6 caracteres</label> <label id="md1"
					style="color: Red; visibility: hidden; position: absolute;">Write
						password</label></td>
			</tr>
			<tr>
				<td>Confirm password</td>

				<td><input name="mdp2" type="password"
					onblur="verifier_mdp2(this)" style="width: 238px;" /> <label
					id="mp" style="color: Red; visibility: hidden; position: absolute;">wrong
						password</label> <label id="mp2"
					style="color: Red; visibility: hidden; position: absolute;">Confirm
						password</label></td>
			</tr>

			<tr>
				<td>User name</td>
				<td><input name="nom" type="text" style="width: 238px;" /></td>
			</tr>
			<tr>

				<td>Email</td>

				<td><input name="email" type="text"
					onchange="verifier_email(this)" style="width: 238px;" /> <span
					id="email1"
					style="color: Red; visibility: hidden; position: absolute;">Votre
						adresse Email n'est pas valide</span></td>
			</tr>

			<tr>
				<td>Role</td>

				<td><select name="slt1" style="width: 242px;">
						<option value="Agent">Agent</option>
						<option value="chef de culture">Culture Chief</option>
						<option value="chef d'exploitation">Operation chief</option>

				</select></td>

			</tr>
			<tr>
				<td>Grade
				<td><input name="grade" type="text" style="width: 238px;" />
				</td>
			</tr>
			<tr>

				<td colspan="2"><input type="submit" name="btn1" value="Add"
					style="border-color: #009999; width: 155px;" />
			</tr>
			<tr>

				<td bgcolor="#669999" colspan="2">&nbsp;
			</tr>
		</table>


		<%@ include file="menu.jsp"%>
		<%@ include file="../pied.jsp"%>
</body>
</html>