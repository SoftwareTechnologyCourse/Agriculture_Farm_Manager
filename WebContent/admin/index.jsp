<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link href="../css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<p>
		<br>
	<h3>
		Welcome in your account
		<%=session.getAttribute("attribut4")%></h3>
	</p>
	<%@ include file="menu.jsp"%>
	<%@ include file="../pied.jsp"%>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>page d'admin</title>
<link href="../css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<%@ include file="header.jsp"%>
	<p> <br><h3>Welcome in your account <%= session.getAttribute("attribut4") %></h3></p> 
<%@ include file="menu.jsp"%>
<%@ include file="../footer.jsp"%>
</body>
</html>  
>>>>>>> branch 'master' of https://github.com/SoftwareTechnologyCourse/Agriculture_Farm_Manager
