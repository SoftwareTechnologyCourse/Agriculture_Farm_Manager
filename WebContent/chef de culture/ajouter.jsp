<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="ma.connexion.*"
	import="java.util.Vector"%>

<%
Connect connexion=new Connect();
 Vector resultat;
 Vector resultat_final;
%>
<!DOCTYPE html>
<html>
<head>
<title>Add a task</title>
<script src="../code_js/essaie.js" type="text/javascript"></script>
<script src="../code_js/calendrier.js" type="text/javascript"></script>
<link href="../css/styles.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="en_tete.jsp"%>
	<h1>Choose a task</h1>
	<FORM name="f" action="ajouter_tache.jsp"
		onsubmit="return verifier_formulaire3();">
		<center>
			<br /> <select name="slt" onchange="display(this.value)"
				style="width: 250px;">
				<option value="0">Choose a task</option>
				<option value="1">Collecting</option>
				<option value="2">Planting</option>
				<option value="3">Treatement</option>
				<option value="4">Delivery</option>
			</select>
		</center>

		<div style="position: relative; top: 0">
			<div id="div0" name="Choix"
				style="visibility: visible; position: auto; top: 0"></div>
			<div id="div1" name="Collectage"
				style="visibility: hidden; position: relative; top: 0">
				<div>
					<table>
						<tr>

							<td bgcolor="#669000" colspan="2"><br /></td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">Area data</td>
						</tr>

						<tr>
							<td>Name d&nbsp;&#39;Operation</td>
							<td><select name="fermelist1"
								style="height: 21px; width: 195px;">
									<option selected="selected" value="selectionner un Nom">Select
										a name</option>

									<%
 resultat=connexion.getData("select NOMFERME from ferme");
	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>

							</select></td>
						</tr>
						<tr>
							<td>Plot's number</td>
							<td><select name="parlist1"
								style="height: 22px; width: 195px;">
									<option selected="selected" value="0">Select an item</option>
									<% 
	resultat=connexion.getData("select CODEPARCELLE from PARCELLE");
	for(int i=0;i<resultat.size();++i)
	{
		resultat_final=(Vector)resultat.elementAt(i);
	%>

									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
	}
	
	%>
							</select></td>
						</tr>
						<tr>
							<td>Greenhouse number</td>

							<td><select name="serlist1"
								style="height: 25px; width: 195px; margin-top: 0px">
									<option selected="selected" value="0">Select an item</option>
									<%

	resultat=connexion.getData("select CODESER from serre");
	for(int i=0;i<resultat.size();++i)
	{
		resultat_final=(Vector)resultat.elementAt(i);
	%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
	}
	%>
							</select></td>
						</tr>
						<tr>
							<td>Pickup coordinates in (m)</td>

							<td>
								X:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								De <input name="X1" type="text" onblur=est_numerique(this,
								"SX") style="height: 20px; width: 40px;" /> <span id="SX"
								style="color: Red; visibility: hidden;">wrong coordinates</span>&nbsp;&nbsp;&nbsp;
								à&nbsp;<input name="x1" type="text" onblur=est_numerique(this,
								"Sx1") style="height: 20px; width: 40px;" /> <span id="Sx1"
								style="color: Red; visibility: hidden;">Wrong coordinates</span>
								<br />

								Y:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								De <input name="Y1" type="text" onblur=est_numerique(this,
								"SY") style="height: 20px; width: 40px;" /> <span id="SY"
								style="color: Red; visibility: hidden;">Wrong coordinates</span>&nbsp;&nbsp;&nbsp;à&nbsp;
								<input name="y1" type="text" onblur=est_numerique(this,
								"Sy1") style="height: 20px; width: 40px;" /> <span id="Sy1"
								style="color: Red; visibility: hidden;">Wrong coordinates</span>
							</td>

						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">Pickup Data</td>
						</tr>
						<tr>
							<td>Pickup Code</td>

							<td><input name="code1" type="text"
								onblur=est_numerique(this, "Scode1") id="txtcode" /> <span
								id="Scode1" style="color: Red; visibility: hidden;">Wrong
									code</span></td>
						</tr>
						<tr>
							<td>Pickup Code</td>

							<td><input name="date1" type="text"
								onFocus="new calendar(this);" style="width: 163px;" /> <span
								id="Sdate1" style="color: Red; display: none;">Wrong data</span>


							</td>
						</tr>
						<tr>

							<td>Caliber 1&nbsp; :</td>
							<td align="center">Weight in kg&nbsp;&nbsp;&nbsp; :<input
								name="calibre1" type="text" onblur=est_numerique(this,
								"Scalibre1") style="width: 70px;" /> <span id="Scalibre1"
								style="color: Red; visibility: hidden;">Wrong data</span>
							</td>

						</tr>
						<tr>
							<td>Caliber 2&nbsp; :</td>
							<td align="center">Weight in kg&nbsp;&nbsp;&nbsp; :<input
								name="calibre2" type="text" onblur=est_numerique(this,
								"Scalibre2") style="width: 70px;" /> <span id="Scalibre2"
								style="color: Red; visibility: hidden;">Wrong data</span>
							</td>
						</tr>
						<tr>
							<td>Caliber 3&nbsp; :</td>
							<td align="center">Weight in kg&nbsp;&nbsp;&nbsp; :<input
								name="calibre3" type="text" onblur=est_numerique(this,
								"Scalibre3") style="width: 70px;" /> <span id="Scalibre3"
								style="color: Red; visibility: hidden;">Wrong data</span>
							</td>
						</tr>
						<tr>
							<td>Caliber 4&nbsp; :</td>

							<td align="center">Weight in kg&nbsp;&nbsp;&nbsp; :<input
								name="calibre4" type="text" onblur=est_numerique(this,
								"Scalibre4") style="width: 70px;" /> <span id="Scalibre4"
								style="color: Red; visibility: hidden;">Wrong data</span>
							</td>
						</tr>
						<tr>
							<td>Quality</td>
							<td><select name="qualist"
								style="height: 20px; width: 140px;">
									<option value="faible">Weak</option>
									<option value="moyenne">Medium</option>
									<option value="grande">Big</option>
									<option selected="selected" value="">Choose a quality</option>
							</select></td>
						</tr>
						<tr>
							<td>Number of Employees</td>
							<td><input name="nbr_emp" onblur=est_numerique(this,
								"Snbr_emp") type="text" /> <span id="Snbr_emp"
								style="color: Red; visibility: hidden;">Wrong data</span></td>
						</tr>
						<tr>
							<td>Total weight&nbsp; Area(kg)</td>
							<td><input name="poids1" type="text"
								onblur=est_numerique(this, "Spoids1")  /> &nbsp;<span
								id="Spoids1" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Observation of diseases</td>
							<td><textarea name="obs_maladie" rows="2" cols="20"
									style="height: 90px; width: 446px;"></textarea></td>
						</tr>
						<tr>
							<td>Collection Observations</td>
							<td><textarea name="obs_cueillette" rows="2" cols="20"
									style="height: 88px; width: 446px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" name="btn1"
								value="Save" style="border-color: #0099CC; width: 150px;" /></td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">&nbsp;</td>
						</tr>
					</table>
				</div>

			</div>

			<div id="div2" name="Plantation"
				style="visibility: hidden; position: absolute; top: 0">
				<div>
					<p>
					<table>

						<tr>
							<td bgcolor="##669000" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td bgcolor="##669000" colspan="2">Area Data</td>
						</tr>

						<tr>
							<td>
								Operations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td class="style11"><select name="fermelist2"
								style="height: 20px; width: 164px;">
									<option selected="selected" value="selectionner un ferme">Select
										a farm</option>

									<%

	resultat=connexion.getData("select NOMFERME from ferme");
for(int i=0;i<resultat.size();++i)
{
		resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
						</tr>
						<tr>
							<td>N°
								Plot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>

							<td><select name="parlist2"
								style="height: 20px; width: 166px;">
									<option selected="selected" value="selectionner un numéro">Select
										a number</option>
									<%

	resultat=connexion.getData("select CODEparcelle from parcelle");
	
for(int i=0;i<resultat.size();++i)
{
		resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
						</tr>
						<tr>
							<td>Number of the
								greenhouse&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><select name="serlist2"
								style="height: 20px; width: 166px;">
									<option selected="selected" value="selectionner un ferme">Select
										a greenHouse</option>
									<%

	resultat=connexion.getData("select CODESER from serre");
	for(int i=0;i<resultat.size();++i)
	{
		resultat_final=(Vector)resultat.elementAt(i);		
	%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
	}
	%>
							</select></td>
						</tr>
						<tr>
							<td>

								Area(Ha)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><input name="surface2" type="text"
								onblur=est_numerique(this,
								"Ssurface2") style="height: 20px; width: 166px;" /> <span
								id="Ssurface2" style="color: Red; visibility: hidden;">Wrong
									code</span></td>
						</tr>
						<tr>
							<td>Picking Coordinates(m)</td>

							<td>X:&nbsp;&nbsp; De <input name="X2" type="text"
								onblur=est_numerique(this,
								"SX2") style="height: 20px; width: 40px;" /> <span id="SX2"
								style="color: Red; visibility: hidden;">Coordinates Wrong</span>
								à <input name="x2" type="text" onblur=est_numerique(this,
								"Sxx2") style="height: 20px; width: 40px;" /> <span id="Sxx2"
								style="color: Red; visibility: hidden;">Woordinates wrong</span>
								<br /> Y:&nbsp;&nbsp; De <input name="Y2" type="text"
								onblur=est_numerique(this,
								"SY2")  style="height: 20px; width: 40px;" /> <span id="SY2"
								style="color: Red; visibility: hidden;">Wrong coordinates</span>
								à <input name="y2" type="text" onblur=est_numerique(this,
								"Syy2") style="height: 20px; width: 40px;" /> <span id="Syy2"
								style="color: Red; visibility: hidden;">Wrong coordinates</span>
							</td>

						</tr>
						<tr>
							<td>Number of plants&nbsp;</td>

							<td><input name="nbr_plante" type="text"
								onblur=est_numerique(this,
								"Snbr_plante") style="height: 20px; width: 166pxpx;" /> <span
								id="Snbr_plante" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">Données de Culture</td>
						</tr>
						<tr>
							<td>Culture
								code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><input name="code2" type="text"
								onblur=est_numerique(this,
								"Scode2") style="height: 20px; width: 166pxpx;" /> <span
								id="Scode2" style="color: Red; visibility: hidden;">Wrong
									code</span></td>
						</tr>
						<tr>
							<td>Culture
								name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><input name="nom" type="text"
								style="height: 20px; width: 166pxpx;" /></td>
						</tr>
						<tr>
							<td>
								Variety&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><input name="variete" type="text"
								style="height: 20px; width: 166pxpx;" /></td>
						</tr>
						<tr>
							<td>
								Mark&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><input name="marque" type="text"
								style="height: 20px; width: 166pxpx;" /></td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">Plantation data</td>
						</tr>
						<tr>
							<td>Plantation Number</td>
							<td><input name="num_plantation" type="text"
								onblur=est_numerique(this,
								"Snum_plantation") style="width: 166pxpx;" /> <span
								id="Snum_plantation" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Date of
								plantation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><input name="date2" type="text"
								onFocus="new calendar(this);" /></td>
						</tr>
						<tr>
							<td>Overgrown</td>
							<td>
								<table id="rnList" border="0">
									<tr>
										<td><input id="rnList_0" type="radio" name="rnList"
											value="OUI" checked="checked" /><label for="rnList_0">Yes</label></td>

									</tr>
									<tr>
										<td><input id="rnList_1" type="radio" name="rnList"
											value="NON" /><label for="rnList_1">No</label></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								Rootstock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>

							<td><input name="porte_greffe" type="text"
								onblur=est_numerique(this, "Sporte_greffe") /> <span
								id="Sporte_greffe" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Year overgriffage&nbsp;&nbsp;</td>

							<td><input name="annee" type="text"
								onblur=est_numerique(this, "Sannee")/> <span id="Sannee"
								style="color: Red; visibility: hidden;">Donnée invalide</span></td>
						</tr>
						<tr>
							<td>
								Descriptions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>

							<td><textarea name="des_plantation" rows="2" cols="20"
									id="txtobs" style="height: 88px; width: 400px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" name="btn1"
								value="Enregistrer" style="border-color: #0099CC; width: 150px;" />
							</td>

						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">&nbsp;</td>
						</tr>
					</table>

				</div>
			</div>
			<div id="div3" name="Traitement"
				style="visibility: hidden; position: absolute; top: 0">
				<div>
					<table>
						<tr>

							<td bgcolor="#669000" colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="4">Area's Data</td>
						</tr>
						<tr>

							<td>Operation</td>
							<td><select name="fermeList3"
								style="height: 20px; width: 200px;">
									<option selected="selected" value="selectionner un code">select
										a code</option>

									<%

	resultat=connexion.getData("select NOMFERME from ferme");
	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
						</tr>
						<tr>
							<td>Area to explore:(m2)</td>
							<td><input name="surface3" type="text"
								onblur=est_numerique(this, "Ssurface3") style="width: 200px;" />
								<span id="Ssurface3" style="color: Red; visibility: hidden;">Wrong
									data</span></td>

						</tr>
						<tr>
							<td>Plot number</td>
							<td><select name="parList3"
								style="height: 20px; width: 200px;">
									<option selected="selected" value="selectionner un numéro">Select
										a number</option>
									<%
	resultat=connexion.getData("select CODEparcelle from parcelle");
	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
							<td>&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<td>GreenHouse's number</td>
							<td><select name="serlist3"
								" style="height: 20px; width: 200px;">
									<option selected="selected" value="selectionner un ferme">Select
										a greenHouse</option>
									<%

	resultat=connexion.getData("select CODESER from serre");
for(int i=0;i<resultat.size();++i)
{
		resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="4">Product data</td>
						</tr>
						<tr>
							<td>Buisness product</td>
							<td>&nbsp;<select name="prlist"
								style="height: 20px; width: 200px;">
									<option selected="selected" value="selectionner un item">Select
										an item</option>
									<%

    resultat=connexion.getData("select CODEPRODUIT from produit");
	for(int i=0;i<resultat.size();++i)
	{
		resultat_final=(Vector)resultat.elementAt(i);	
	%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
	}
	%>
							</select> &nbsp;&nbsp;&nbsp;
							</td>
							<td>&nbsp;</td>

							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Ennemie</td>
							<td><select name="ennList" id="ennList"
								style="height: 20px; width: 200px;">
									<%

	resultat=connexion.getData("select CODEENNEMIE from ennemie");
	for(int i=0;i<resultat.size();++i)
	{
		resultat_final=(Vector)resultat.elementAt(i);
	%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
	}
	%>
							</select></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="4">Treatment Data</td>
						</tr>
						<tr>
							<td>Treatment's code</td>
							<td><input name="code3" type="text"
								onblur=est_numerique(this, "Scode3") style="width: 200px;" /> <span
								id="Scode3" style="color: Red; visibility: hidden;">Wrong
									code</span></td>
						</tr>


						<tr>
							<td>Treatement type</td>
							<td><select name="typetrList"
								style="height: 20px; width: 200px;">
									<option value="Dose(L-kg/HA):26 cc">Dose(L-kg/HA):26
										cc</option>
									<option value="Consentrie(L-g/Ha):25cc">Consentrie(L-g/Ha):25cc</option>

									<option value="Boulie(L-kg/Ha):2500l">Boulie(L-kg/Ha):2500l</option>

							</select></td>
						</tr>

						<tr>
							<td>Treatment data</td>
							<td><input name="date3" type="text" id="txtannee"
								onFocus="new calendar(this);" style="width: 200px;" /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>

							<td>Total quantity (kg)</td>
							<td><input name="quantite" type="text"
								onblur=est_numerique(this, "Squantite") style="width: 200px;" />
								<span id="Squantite" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Caterer</td>
							<td><input name="agent" type="text" id="txtagent"
								style="width: 200px;" /></td>
						</tr>
						<tr>
							<td>Duration of treatment in hours</td>
							<td><input name="duree" type="text"
								onblur=est_numerique(this, "Sduree") style="width: 200px;" /> <span
								id="Sduree" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Total Cost of Product</td>

							<td><input name="cout_prod" type="text"
								onblur=est_numerique(this, "Scout_prod") style="width: 200px;" />
								<span id="Scout_prod" style="color: Red; visibility: hidden;">Wrong
									data</span></td>
						</tr>
						<tr>
							<td>Observations&nbsp; :</td>

							<td colspan="3"><textarea name="obs" rows="2" cols="20"
									id="txtobs" style="height: 96px; width: 400px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;<input type="submit" name="btn1"
								value="Enregistrer" style="border-color: #0099CC; width: 151px;" />
							</td>
						</tr>

						<tr>
							<td colspan="4" bgcolor="#669000">&nbsp;</td>
						</tr>
					</table>
				</div>

			</div>
			<div id="div4" name="Livraison"
				style="visibility: hidden; position: absolute; top: 0">
				<div>
					<table>
						<tr>
							<td bgcolor="#669000" colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<td bgcolor="#669000">Delivery code</td>
							<td><input name="code4" type="text"
								onblur=est_numerique(this, "Scode4") style="width: 250px;" /> <span
								id="Scode4" style="color: Red; visibility: hidden;">Wrong
									code</span></td>
						</tr>

						<tr>
							<td>Carrier</td>
							<td><select name="translist" id="translist"
								style="height: 20px; width: 250px;">
									<option selected="selected" value="Selelction un Transporteur">Select
										a carrier</option>
									<%

    resultat=connexion.getData("select CODETRAN from transporteur");
	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
						</tr>
						<tr>
							<td>Date&nbsp; Of delivery</td>

							<td><input name="date4" type="text" id="txtmatiere"
								onfocus="new calendar(this);" style="width: 250px;" /></td>
						</tr>
						<tr>

							<td>Farming</td>
							<td><select name="fermeList4" id="cultList"
								style="height: 20px; width: 250px; margin-top: 0px">
									<option selected="selected"
										value="selectionner le code de culture">Select a
										farming code</option>
									<%

 	resultat=connexion.getData("select CODEferme from ferme");
	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
%>
									<option value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
									<%
}
%>
							</select></td>
						</tr>

						<tr>
							<td>Number of Gadgette</td>
							<td><input name="nbr_gadgette" type="text"
								onblur=est_numerique(this,
								"Snbr_gadgette") style="width: 250px;" /> <span
								id="Snbr_gadgette" style="color: Red; visibility: hidden;">Worng
									data</span></td>
						</tr>

						<tr>
							<td>Weight (Kg)</td>
							<td><input name="poids4" onblur=est_numerique(this,
								"Spoids4")  style="width: 250px;" /> <span id="Spoids4"
								style="color: Red; visibility: hidden;">Wrong data</span></td>
						</tr>

						<tr>
							<td colspan="2">
								<p>
									<input type="submit" name="btn1" value="Save"
										style="border-color: #0099CC; width: 150px;" />
								</p>
							</td>
						</tr>
						<tr>
							<td bgcolor="#669000" colspan="2">&nbsp;</td>
						</tr>
					</table>
				</div>

			</div>

		</div>

	</FORM>
	<%@ include file="menu.jsp"%>
	<%@ include file="../pied.jsp"%>
</body>
</html>
