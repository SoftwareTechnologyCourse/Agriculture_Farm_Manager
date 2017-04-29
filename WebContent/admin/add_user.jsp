<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="javaScript">
function verifier_email(champ) {
	   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	   var email = champ.value;
	   if(reg.test(email) == false) {
		   document.getElementById("email1").style.visibility="visible";
		   document.getElementById("email1").style.position="relative";
	      return false;
	   }
	   else
	   {
		   document.getElementById("email1").style.visibility="hidden";
		   document.getElementById("email1").style.position="absolute";
		  
	   }
	   return true;
	}
function verifier_mdp1(champ)
{
	var mdp1=champ.value;
	if(mdp1=="")
	{
		document.getElementById("md1").style.visibility="visible";
		document.getElementById("md1").style.position="relative";
		document.getElementById("md").style.visibility="hidden";
		return false;
	}
	else if(mdp1.length<6)
	{
		document.getElementById("md1").style.visibility="hidden";
		document.getElementById("md").style.visibility="visible";
		document.getElementById("md1").style.position="absolute";
	}
	else
	{
		document.getElementById("md1").style.position="absolute";
		document.getElementById("md1" ).style.visibility="hidden";
		document.getElementById("md").style.visibility="hidden";
		return true;
	}
}
function verifier_mdp2(champ)
{
	var mdp1=f.mdp1.value;
	var mdp2=champ.value;
	if(mdp2=="")
	{
		document.getElementById("mp2").style.visibility="visible";
		document.getElementById("mp").style.visibility="hidden";
		document.getElementById("mp2").style.position="relative";
		return false;
	}
	else if(mdp1!=mdp2)
	{
		document.getElementById("mp").style.visibility="visible";
		document.getElementById("mp2").style.visibility="hidden";
		document.getElementById("mp2").style.position="absolute";
	}
	else
	{
		document.getElementById("mp").style.visibility="hidden";
		document.getElementById("mp2").style.visibility="hidden";
		document.getElementById("mp2").style.position="absolute";
		return true; 
	}
}
function verifier_formulaire()
{
	var mdp1=verifier_mdp1(f.mdp1);
	var mdp2=verifier_mdp2(f.mdp2);
	var email=verifier_email(f.email);
	if(mdp1 &&  mdp2 && email)
		return true;
	else
	{
		return false;
	}
}
</script>
<title>Add User</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>

<%@ include file="header.jsp"%>
  <form name="f"  action="ajouter_ouvrier.jsp"  METHOD="post" onsubmit="return verifier_formulaire()" >
  <H1>Write the user data </H1>

    <table  width="500">
        <tr>
            <td bgcolor="#669999"  colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#669000" >
                Add User</td>

            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                ID User</td>
            <td >
                <input name="id" type="text"   style="width:238px;" />

                <span id="Scode1" style="color:Red;display:none;">please write your correct data</span>
            </td>
        </tr>
        <tr>
            <td >
                Password</td>
            <td >

                <input name="mdp1" type="password"  onblur="verifier_mdp1(this)" style="width:238px;" />
				<label id="md" style="color:Red;visibility:hidden;position:auto;">Min 6 caracters</label>
                <label id="md1" style="color:Red;visibility:hidden;position:absolute;">write your password</label>
            </td>
        </tr>
        <tr>
            <td >

                Confirm your password </td>

            <td >
                <input name="mdp2" type="password"  onblur="verifier_mdp2(this)" style="width:238px;" />
                <label id="mp" style="color:Red;visibility:hidden;position:absolute;">Password invalid</label> 
              	<label id="mp2" style="color:Red;visibility:hidden;position:absolute;">Confirm your password</label> 
            </td>
        </tr>

        <tr>
            <td >

                User Name</td>
            <td >
                <input name="nom" type="text"  style="width:238px;" />
            </td>
        </tr>
        <tr>

            <td >
                Email</td>

            <td >
                <input name="email" type="text" onchange="verifier_email(this)" style="width:238px;" />
                <span id="email1" style="color:Red;visibility:hidden;position:absolute;">Your adress Email is not valid</span>
            </td>
        </tr>

        <tr>
            <td >Role</td>

            <td >
                <select name="slt1"  style="width:242px;">
	<option value="Agent">Agent</option>
	<option value="chef de culture">Culture chief </option>
	<option value="chef d'exploitation">Operating Chief </option>

</select>
            </td>

        </tr>
        <tr>
            <td >
                Grade
            <td >

                <input name="grade" type="text"  style="width:238px;" />
            </td>
        </tr>
        <tr>

            <td colspan="2">
    <input type="submit" name="btn1" value="Ajouter"  style="border-color:#009999;width:155px;" />
            </tr>
        <tr>

            <td  bgcolor="#669999" colspan="2">
                &nbsp;</tr>
    </table>

    
<%@ include file="menu.jsp"%>
 <%@ include file="../footer.jsp"%>
</body>
>>>>>>> branch 'master' of https://github.com/SoftwareTechnologyCourse/Agriculture_Farm_Manager
</html>