<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ma.connexion.*"  import="java.util.Vector" %>
   
<%
Connect connexion=new Connect();
Vector resultat;
Vector resultat_final;
%>
<!DOCTYPE html >
<html>
<head>
<title>Add Operation</title>
<script src="../code_js/essaie.js" type="text/javascript"></script>
<link href="../css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<script src="../code_js/calendar.js" type="text/javascript"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
</head> 
<body>
<%@ include file="header.jsp"%>
<h1>Choose Operation</h1>
<FORM name="f"  action="add.jsp" onsubmit="return verifier_formulaire2();"> 
<center><br/>
<select  name="slt" onchange="display(this.value)" style="width:250px;">
<option value="0" >Choose Operation</option>
<option  value="1">Stock IN</option>
<option value="2">Stock OUT</option>
<option value="3">Product</option> 
<option value="4">Ennemi</option> 
<option value="5">Machine</option>
</select>
</center>

<div style="position:relative;top:0"> 
<div id="div0" name="Choix" style="visibility:visible;position:absolute;top:0"></div>
<div id="div1" name="stock_entré" style="visibility:hidden;position:absolute;top:0">
<br/>
  <div > 
    <table>
        <tr>
                    <td  colspan="2" bgcolor="#669000">
                        Stock State</td>
                </tr>
        	<tr> 
            <td >
                Code Of Stock IN:
                </td>
                <td>
                <input name="code1" type="text" id="txtcodein" onblur="verifier_code(this)" style="width:250px;"  />
                <span id="Scode1" style="color:Red;visibility:hidden;">Wrong code</span>
				</td>
                </tr>
                <tr>
                <td>
                Designation
                </td>
                <td>
                <input name="designation1" type="text" onblur="verifier_designation(this)"  style="width:250px;"  />
                <span id="Sdesignation1" style="color:Red;visibility:hidden;">Please enter a data</span>
                </td>
                </tr> 
                <tr>
                <td>
                quantity&nbsp;&nbsp;&nbsp;                 </td>
                <td>
                <input name="quantite1" type="text"  onblur="verifier_quantite(this)" style="width:250px;"  />
				<span id="Squantite1" style="color:Red;visibility:hidden;">wrong Quantity </span>
                </td>
                </tr>
                <tr>
                <td>
                Enter date
                </td>
                <td>
                <input name="date1" type="text" id="txtdatein" onFocus="new calendar(this);" style="width:250px;"  />
                <span id="date" style="color:Red;visibility:hidden;">Wrong Date</span>
            	</td>
            	</tr>
				<tr>
				<td>
                Magazin&nbsp;&nbsp;
                </td>
                <td>
                <input name="magasin1" type="text" id="txtmagasin" style="width:250px;"  />
                </td>
                </tr>
                <tr>
                <td>
                Agent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td> 
                <td>
                <input name="agent1" type="text" id="txtagent" style="width:250px;" />
				<span id="CompareValidator4" style="color:Red;visibility:hidden;">Wrong name </span>
                </td>
                <tr>
                <td>
                State :&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                <select name="lstetat" id="lstetat" style="height:30px;width:253px;">
	<option value="Degradé">Degrad&#233;</option>
	<option selected="selected" value="neuf">new</option>

	<option value="périmé">p&#233;rim&#233;</option>
	<option value="Acheujet">Acheujet</option>
	<option value="Senne">Senne</option>

</select>
                </td>
                <tr>
                <td>
                Observations:
				</td>
				<td>
                <textarea name="obs1" rows="2" cols="20" id="txtobs" style="height:102px;width:380px;"></textarea>
                </td>
             </tr>
        <tr>
            <td >
<input type="submit" name="btn1" value="Enregistrer"  style="border-color:#0099CC;width:150px;" />
    </td>
        </tr>
        <tr>
        <td  colspan="2" bgcolor="#669000">
        &nbsp;
        </td>
        </tr>
    </table>
      </div>
</div>
<div id="div2" name="stock_sorti" style="visibility:hidden;position:auto;top:0">
<br/>
<div >
    
 <table>
        	<tr> 
            <td bgcolor="#669000" colspan=2 >
			Stock out
            </td>
        	</tr>
        	<tr>
            	<td>
                Code of stock out:
                </td>
                <td>
                <input name="code2" type="text" id="txtcode" onblur="verifier_code(this)" style="width:250px;" />
                <span id="Scode2" style="color:Red;visibility:hidden;">Wrong Code </span>
				</td>
                </tr>
				<tr>
				<td>
                Product Name
                </td>
                <td>
                <select name="nom_produit2" id="lstcodep" style="height:35px;width:250px;">
                <option selected="selected" value="choisir un produit">Choose a product</option>
                	<%

	resultat=connexion.getData("select NOMCOMMERCIAL from produit");
                	for(int i=0;i<resultat.size();++i)
        			{
        	  			resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	%> 
				</select>
               </td>
               </tr>
               <tr>
               <td>
                Machine Name
                </td>
                <td>
           <select name="nom_machine2" id="lstcodem" style="height:35px;width:250px;">
	<option selected="selected" value="choisir une machine">Choose a machine</option>
  	<%

	resultat=connexion.getData("select NOMMACHINE from machine");
	 
  	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	 
	%> 
</select>
                </td>
                </tr>
                <tr>
                <td>
                Designation:
                </td>
                <td>
                <input name="designation2" type="text" onblur="verifier_designation(this)" id="txtdesig" style="width:250px;" />
                <span id="Sdesignation2" style="color:Red;visibility:hidden;">Enter a data</span>
				</td>
				</tr>
                <tr>
                <td>
                Quantity
                </td>
                <td>
                <input name="quantite2" type="text" id="txtquantite" onblur="verifier_quantite(this)" style="width:250px;" />
                <span id="Squantite2" style="color:Red;visibility:hidden;">Wrong quantity</span>
                </td>
                </tr>
                <tr>
                <td>
                Date Out
				</td>
				<td>                
                <input name="date2" type="text" id="txtdateout" onFocus="new calendar(this);" style="width:250px;" />
                </td>
                </tr>
                <tr>
                <td>
				Magasin
				</td>
				<td>
                <input name="magasin2" type="text" id="txtmagasin" style="width:250px;" >
				</td>
				</tr>
				<tr>
                <td>
                Agent
                </td>
                <td>
                <input name="agent2" type="text" id="txtagent" style="width:250px;" />
                </td>
                </tr>
                <tr>
                <td>
                Task:
                </td>
				<td>
				<input name="tache" type="text"  style="width:250px;" />
                </td>
                </tr>
                <tr>
                <td>
                Observation
                </td>
                <td>
                <textarea name="obs1" rows="2" cols="20" id="txtobs" style="height:102px;width:380px;"></textarea>
                </td>
        		</tr>
        		<tr>

            <td >
                <input type="submit" name="btn1" value="Enregistrer"  style="border-color:#0099CC;width:150px;" />
    &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#669000" colspan=2>
                &nbsp;</td>
        </tr>
    </table> 

     </div>

</div>

<div id="div3" name="Produit" style="visibility:hidden;position:absolute;top:0">
<br/>
 <div >
        <table >
            <tr bgcolor="#669000">
                <td bgcolor="#669000" colspan="2">
                    Product data</td>
                    </tr>
            <tr>

                <td bgcolor="#669000">
                    <b>Product code:&nbsp; </b> </td>
                        <td>
        <input name="code3" type="text" onblur="verifier_code(this)" id="txtcode" style="width:250px;" />
                            <span id="Scode3" style="color:Red;visibility:hidden;">Code wrong</span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <b>Buisnee name:&nbsp;
                            </b>
                            </td>
                        <td>
        <input name="nom_produit3" type="text" id="txtnom" style="width:250px;" />
        <span id="RequiredFieldValidator1" style="color:Red;visibility:hidden;">Enter data</span>

                            </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Furnisher&nbsp;&nbsp; :</b></td>
                        <td>
                            <select name="fornlist"  style="height:30px;width:253px;">
	<option selected="selected" value="choisir un fournisseur">Choose a furnisher</option>
	  	<%
		resultat=connexion.getData("select CODEFOUR from fournisseur");
	  	for(int i=0;i<resultat.size();++i)
		{
  			resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	
	%> 
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>active material: </b> </td>

                        <td>
        <input name="matiere" type="text"  style="width:250px;" />
        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Molecule: </b> </td>

                        <td>
        <input name="molecule" type="text"  style="width:250px;" />
         
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Stock code</b></td>

                        <td>
                            <select name="LSTCODEST3" id="LSTCODEST" style="height:26px;width:253px;">
                            <option selected="selected" value="choisir un stock">choose a stock</option>
                            	  	<%

	 resultat=connexion.getData("select CODESTOCKE from stocke"); 
     for(int i=0;i<resultat.size();++i)
     {
     	resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	%> 
                            
					</select>
                        </td>
                    </tr>
                         <tr>
                        <td>
                            <b>Product image</b></td>

                        <td>
                            <select name="img_produit"  style="height:26px;width:253px;">
                            <option selected="selected" value="choisir une image">Choose an Image</option>
                            	  	<%

	 resultat=connexion.getData("select ID_IMG from imageproduit "); 
     for(int i=0;i<resultat.size();++i)
     {
     	resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	 
	%> 
                            
					</select>
                        </td>
                    </tr>
                 <tr>
                        <td >
    
    <input type="submit" name="btn1" value="Enregistrer"  style="border-color:#0099CC;width:150px;" />

    

                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#669000" colspan="2">
                            &nbsp;</td>
                    </tr>

                </table>
    </div>


</div>
<div id="div4" name="Ennemi" style="visibility:hidden;position:absolute;top:0">
<br/>
  <div >
        <table >
            <tr bgcolor="#669000">
                <td bgcolor="#669000" colspan="2">
                    Ennemy data</td>
                    </tr>
            <tr>
                <td bgcolor="#669000" >

                    Name &nbsp;Product:&nbsp; </td>
                        <td>
                            <select name="prodlist" id="prodlist" style="height:25px;width:147px;">
	<option selected="selected" value="Nom produit">Product Name</option>
	                          	  	<%

	 resultat=connexion.getData("select NOMCOMMERCIAL from produit"); 
	for(int i=0;i<resultat.size();++i)
	{
  		resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	%> 
</select>

                        </td>
                    </tr>
                    <tr>
                        <td >
                            Code Ennemy</td>
                        <td>
        <input name="code4" type="text"  onblur="verifier_code(this)" style="width:219px;" />
                            <span id="Scode4" style="color:Red;visibility:hidden;">Code Wrong</span>

                        </td>
                    </tr>
                    <tr>
                        <td >
                                                        Name Ennemy</td>
                        <td>
        <input name="nom_ennemie" type="text"  style="width:219px;" />
                            <span id="CompareValidator2" style="color:Red;visibility:hidden;">Wrong data</span>

                        </td>
                    </tr>
                    <tr>
                        <td >
                                                        Ennemy Picture</td>
                        <td>
                            <input type="file" name="pic_ennemie"  style="height:22px;width:400px;" />
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
    <p>
    <input type="submit" name="btn1" value="Enregistrer"  style="border-color:#0099CC;width:150px;" />
    </p>
                        </td>

                    </tr>
                    <tr>
                        <td bgcolor="#669000" colspan="2">
                            &nbsp;</td>
                    </tr>
                </table>
    </div>


</div>
<div id="div5" name="Machine" style="visibility:hidden;position:absolute;top:0">

  <div >
     <table >
                <tr>
                    <td  colspan="2" bgcolor="#669000">
                        Machine data</td>
                </tr>

                <tr>
                    <td >
                        Machine code</td>
                    <td>
                        <input name="code5" onblur="verifier_code(this)" type="text" id="txtcode" style="width:184px;" />
                        <span id="Scode5" style="color:Red;visibility:hidden;">Code wrong</span>
                    </td>
                </tr>

                <tr>
                    <td >
                        Machine name</td>
                    <td>
                        <input name="nom_machine5" type="text" id="txtnom" style="width:184px;" />
                        <span id="RequiredFieldValidator1" style="color:Red;visibility:hidden;">Wrong data</span>
                    </td>
                </tr>

                <tr>
                    <td >
                        Code d&#39;stock In</td>
                    <td>
                        <select name="LSTCODEST5" id="lstcodest" style="height:22px;width:188px;">
	<option value="Choisir un stock">Choose a stock</option>
                          	  	<%

	 resultat=connexion.getData("select CODESTOCKE from instocke"); 
     for(int i=0;i<resultat.size();++i)
     {
     	resultat_final=(Vector)resultat.elementAt(i);
	%>
	<option  value="<%=resultat_final.elementAt(0) %>"><%=resultat_final.elementAt(0) %></option>
	<%
	}
	 
	%> 
</select>

                        
                    </td>
                </tr>
                <tr>
                    <td >
                        Observations</td>
                    <td>
                        <textarea name="obs5" rows="2" cols="20" id="txtobser" style="height:90px;width:401px;"></textarea>
                    </td>

                </tr>
                <tr>
                    <td  colspan="2">
                        <input type="submit" name="btn1" value="Enregistrer"  style="border-color:#0099CC;width:140px;" />
                    </td>
                </tr>
                <tr>
                    <td  colspan="2" bgcolor="#669000">
                        &nbsp;</td>
				</tr>
            </table>
      </div>

</div>
 </div>
</FORM>
<%@ include file="menu.jsp"%>
<%@ include file="../footer.jsp"%>
</body>
</html> 