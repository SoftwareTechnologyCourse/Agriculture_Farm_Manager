<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="ma.connexion.*" import="java.sql.*"%>
<% 
Connect connexion=new Connect();
String ID =request.getParameter("id");
String password1 =request.getParameter("mdp1");
String nom =request.getParameter("nom");
String email =request.getParameter("email");
String grade =request.getParameter("grade");
String role = request.getParameter("slt1"); 
String btn1=request.getParameter("btn1");
String requet="insert into user values('"+ID+"','"+password1+"','"+email+"',\""+role+"\",'"+nom+"','"+grade+"')";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<% 
	if(btn1!=null){
		if(ID=="" && password1=="" && grade=="" && email=="" && nom=="" )
		{
			out.println("Write Id fields");
		}
		else
		{
try {
    connexion.setData(requet); 
	out.println("les données ont bien été enregistrées" );
	}catch(Exception ex){    
		out.println(ex); 
		}
	}
	}
%>
	<%@ include file="menu.jsp"%>
	<%@ include file="../pied.jsp"%>
</body>
</html>

