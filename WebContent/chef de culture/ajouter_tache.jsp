<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="ma.connexion.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Add an operation</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a user</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<%
Connect connexion=new Connect();
String requet=""; 
String exploitation=request.getParameter("slt");
int valeur=Integer.parseInt(exploitation);

String surface=request.getParameter("surface"+valeur);
String poid=request.getParameter("poids"+valeur);
String X=request.getParameter("X"+valeur);
String x=request.getParameter("x"+valeur);
String Y=request.getParameter("Y"+valeur);
String y=request.getParameter("y"+valeur);
String code_serre=request.getParameter("serlist"+valeur);
String date=request.getParameter("date"+valeur);
String code=request.getParameter("code"+valeur);
String btn1=request.getParameter("btn1"); 

String calibre1=request.getParameter("calibre1"); 
String calibre2=request.getParameter("calibre2"); 
String calibre3=request.getParameter("calibre3"); 
String calibre4=request.getParameter("calibre4"); 
String nbr_emp=request.getParameter("nbr_emp");
String qualite=request.getParameter("qualist");
String resp=request.getParameter("resp_exp");
String obs_cueillette=request.getParameter("obs_cueillette");
String obs_maladie=request.getParameter("obs_maladie");


String nom=request.getParameter("nom");
String variete=request.getParameter("variete");
String marque=request.getParameter("marque");

String nbr_plante=request.getParameter("nbr_plante");
String num_plantation=request.getParameter("num_plantation");
String Surgriffage=request.getParameter("rnList");
String porte_greffe=request.getParameter("porte_greffe");
String annee=request.getParameter("annee");
String description=request.getParameter("des_plantation");

String obs=request.getParameter("obs");
String cout_prod=request.getParameter("cout_prod");
String duree=request.getParameter("duree");
String agent=request.getParameter("agent");
String quantite=request.getParameter("quantite");
String type=request.getParameter("typetrList");
String code_produit=request.getParameter("prlist");

String code_culture=request.getParameter("fermeList4");
String code_trans=request.getParameter("translist");
String nbr_gadgette=request.getParameter("nbr_gadgette");

String requet_2="insert into plantation values('"+num_plantation+"','"+surface+"','"+date+"','"+nbr_plante+"','"+Surgriffage+"','"+annee+"','"+X+"','"+x+"','"+Y+"','"+y+"','"+description+"','"+porte_greffe+"','"+code_serre+"')";
String requet1="insert into cueillette values('"+code+"','"+code_serre+"','"+date+"','"+qualite+"','"+poid+"','"+nbr_emp+"','"+calibre1+"','"+calibre2+"','"+calibre3+"','"+calibre4+"','"+obs_cueillette+"','"+obs_maladie+"','"+X+"','"+x+"','"+Y+"','"+y+"')";
String requet2="insert into culture  values('"+code+"','"+nom+"','"+variete+"','"+marque+"')";
String requet4="insert into Livraison  values('"+code+"','"+code_culture+"','"+date+"','"+poid+"','"+nbr_gadgette+"','"+code_trans+"')";
String requet3="insert into traitement values('"+code+"','"+code_serre+"','"+date+"','"+duree+"','"+obs+"','"+type+"','"+quantite+"','"+cout_prod+"','"+agent+"','"+surface+"','"+code_produit+"')";

switch(valeur)
{
case 1:
	requet=requet1;
	break;
case 2:
	requet=requet2;
	break;
case 3:
	requet=requet3;
	break;
case 4:
	requet=requet4;
	break;
default:out.println("erreur");
}
if(btn1!=null)
{
if(valeur==2)
{
	try{
		connexion.setData(requet_2);
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
}

 
	try {
		connexion.setData(requet);
		out.println("Data are saved");
	}catch(Exception e){
		out.println(e);
		}

}
%>
	<%@ include file="menu.jsp"%>
	<%@ include file="../pied.jsp"%>
</body>
</html>