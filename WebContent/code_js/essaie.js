function verifier_fax(champs)
{
	var regexTel = /^(002125)(?:[ _.-]?(\d{2})){4}$/;
	var numeroTel = champs.value;
	if(regexTel.test(numeroTel)==false){
		document.getElementById("Sfax"+valeur()).style.visibility="visible";
		return false;
	}
	else {
		document.getElementById("Sfax"+valeur()).style.visibility="hidden";
		return true;
}
}
function verifier_tel(champs,id)
{
	var regexTel = /^(00212[5-6])(?:[ _.-]?(\d{2})){4}$/;
	var numeroTel = champs.value;
	if(regexTel.test(numeroTel)==false){
		document.getElementById(id).style.visibility="visible";
		return false;
	}
	else {
		document.getElementById(id).style.visibility="hidden";
		return true;
}
}
function verifier_email(champ) {
	   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	   var email = champ.value;
	   if(reg.test(email) == false) {
		   document.getElementById("Semail"+valeur()).style.visibility="visible";
			
	      return false;
	   }
	   else
	   {
		   document.getElementById("Semail"+valeur()).style.visibility="hidden";
		   
		  
	   }
	   return true;
	}
var oldId = "div0";
function display(_value)
{
var _id = "div"+_value;
document.getElementById(oldId).style.visibility="hidden";
document.getElementById(_id).style.visibility="visible";
oldId = _id;
} 

function verifier_formulaire()
{
	var valeur1=valeur();
	var tel;
	var fax;
	var email;
	var code;
	var condition;
	var k=parseInt(valeur1);
	switch (k)
	{
	case 1:
	tel=verifier_tel(f.tel1,"Stel1");
	fax=verifier_fax(f.fax1);
	email=verifier_email(f.email1);
	code=verifier_code(f.code1);
	condition=code && tel && email && fax;
	break;
	case 2:
		tel=verifier_tel(f.tel1,"Stel2");
		fax=verifier_fax(f.fax2);
		email=verifier_email(f.email2);
		code=verifier_code(f.code2);
		condition=code && tel && email && fax;
	break;
	case 3:
		tel=verifier_tel(f.tel3,"Stel3");
		fax=verifier_fax(f.fax3);
		email=verifier_email(f.email3);
		code=verifier_code(f.code3);
		condition=code && tel && email && fax;
	break;
	case 4:
		tel=verifier_tel(f.tel4,"Stel4");
		fax=verifier_fax(f.fax4);
		email=verifier_email(f.email4);
		code=verifier_code(f.code4);
		var tarif=est_numerique(f.tarif4,"Starif4");
		condition=code && tel && email && fax&&tarif;
	break;
	}
	
	
	if(  condition  )
		      return true;
	   else{
		   
		   return false;
}
}

function verifier_code(champ)
{
	
		
	if(isNaN(champ.value)|| champ.value=="")
	{
	document.getElementById("Scode"+valeur()).style.visibility="visible";
		return false;
	}
	else
	{
		document.getElementById("Scode"+valeur()).style.visibility="hidden";
		
	}
	return true;
}
 
function valeur()
	{ 
		
		sel = document.getElementById('slt');
		agent = sel.options[sel.selectedIndex].value;

		return agent;
	}
function verifier_quantite(champ)
{
	if(isNaN(champ.value)|| champ.value=="")
	{
	document.getElementById("Squantite"+valeur()).style.visibility="visible";
		return false;
	}
	else
	{
		document.getElementById("Squantite"+valeur()).style.visibility="hidden";
		
	}
	return true;
}
function verifier_designation(champ)
{
	if(champ.value=="")
	{
		document.getElementById("Sdesignation"+valeur()).style.visibility="visible";
		return false;
	}
	else
	{
		document.getElementById("Sdesignation"+valeur()).style.visibility="hidden";
		return true;
	}
}
function verifier_formulaire1()
{
	var code;
	var designation;
	var quantite;
	var valeur1=valeur();
	var designationx;
	var quantitex;
	var codex;
	var requet;
	var k=parseInt(valeur1);
	switch (k)
	{
	case 1:
		codex=f.code1;
		designationx=f.designation1;
		quantitex=f.quantite1;
		
		
	break;
	case 2:
		codex=f.code2;
		designationx=f.designation2;
		quantitex=f.quantite2;
	break;
	case 3:
		codex=f.code3;
		designationx=true;
		quantitex=true;
	break;
	}
	code=verifier_code(codex);
	designation=verifier_designation(designationx);
	quantite=verifier_quantite(quantitex);
	if( code && designation && quantite )
	      return true;
 else{
	   
	   return false;
 	}
}
function verifier_formulaire2()
{
	var code;
	var designation;
	var quantite;
	var valeur1=valeur();
	var requet;
	var k=parseInt(valeur1);
	switch (k)
	{
	case 1:
		code=verifier_code(f.code1);
		designation=verifier_designation(f.designation1);
		quantite=verifier_quantite(f.quantite1);
		requet=code&&designation&&quantite;
		break;
	case 2:
		code=verifier_code(f.code2);
		designation=verifier_designation(f.designation2);
		quantite=verifier_quantite(f.quantite2);
		requet=code&&designation&&quantite;
	break;
	case 3:
		code=verifier_code(f.code3);
		requet=code;
	break;
	case 4:
		code=verifier_code(f.code4);
		requet=code;
	break;
	case 5:
		code=verifier_code(f.code5);
		requet=code;
	break;
	}
	if(requet )
	      return true;
else{
	   
	   return false;
	}
}
function verifier_formulaire5()
{
	var code;
	var surface;
	var nbr_parcelle;
	var nbr_secteur;
	var surface_cultive;
	var surface_ncultive;
	var tel;
	var valeur1=valeur();
	var condition;
	var k=parseInt(valeur1);
	switch (k)
	{
	case 1:
		code=verifier_code(f.code1);
		tel=verifier_tel(f.tel_exp,"Stel");
		nbr_parcelle=est_numerique(f.nbr_parcelle,"Snbr_parcelle");
		nbr_secteur=est_numerique(f.nbr_secteur,"Snbr_secteur");
		condition=code&&tel&&nbr_parcelle&&nbr_secteur;
		break;
	case 2:
		code=est_numerique(f.code2,"codeC");
		surface=est_numerique(f.surface2,"Ssurface2");
		surface_cultive=est_numerique(f.surface_cultuve,"Ssurface_cultuve");
		surface_ncultive=est_numerique(f.surface_ncultuve,"Ssurface_ncultuve");
		nbr_secteur=est_numerique(f.nbr_serre,"Snbr_serre");
		condition=code&&nbr_secteur&&surface&&surface_cultive&&surface_ncultive
	break;
	case 3:
		code=est_numerique(f.code3,"Scode3");
		surface=est_numerique(f.surface3,"Ssurface3");
		condition=code&&surface;
	break;
	
	}
	if(condition)
	      return true;
else{
	   
	   return false;
	}
}
function est_numerique(champ,id)
{
	if(isNaN(champ.value)|| champ.value=="")
	{
	document.getElementById(id).style.visibility="visible";
		return false;
	}
	else
	{
		document.getElementById(id).style.visibility="hidden";
		
	}
	return true;
}
function verifier_formulaire3()
{	
	var X;
	var x;
	var Y;
	var y;
	
	var poid;
	var code;
	var valeur1=valeur();
	var condition;
	var k=parseInt(valeur1);
	switch (k)
	{
	case 1:
		 code=est_numerique(f.code1,"Scode1");
		 X=est_numerique(f.X1,"SX");
		 x=est_numerique(f.x1,"Sx1");
		 Y=est_numerique(f.Y1,"SY");
		 y=est_numerique(f.y1,"Sy1");
		var calibre1=est_numerique(f.calibre1,"Scalibre1");
		var calibre2=est_numerique(f.calibre2,"Scalibre2");
		var calibre3=est_numerique(f.calibre3,"Scalibre3");
		var calibre4=est_numerique(f.calibre4,"Scalibre4");
		var nbr_emp=est_numerique(f.nbr_emp,"Snbr_emp");
		 poid=est_numerique(f.poids1,"Spoids1");
		condition=code&&X&&x&&Y&&y&&calibre1&&calibre2&&calibre3&&calibre4&&nbr_emp&&poid;
		break;
	case 2:
		 code=est_numerique(f.code2,"Scode2");
		 X=est_numerique(f.X2,"SX2");
		 x=est_numerique(f.x2,"Sxx2");
		 Y=est_numerique(f.Y2,"SY2");
		 y=est_numerique(f.y2,"Syy2");
		 var porte_greffe=est_numerique(f.porte_greffe,"Sporte_greffe");
		 condition=code&&X&&x&&Y&&y&&porte_greffe;
		 break;
	case 3:
		 code=est_numerique(f.code3,"Scode3");
		 var surface=est_numerique(f.surface3,"Ssurface3");
		 var quantite=est_numerique(f.quantite,"Squantite");
		 var duree=est_numerique(f.duree,"Sduree");
		 var cout=est_numerique(f.cout_prod,"Scout_prod");
		 condition=code&&surface&&quantite&&duree&&cout;
		 break;
	case 4:
		 code=est_numerique(f.code4,"Scode4");
		 poid=est_numerique(f.poids4,"Spoids4");
		 condition=code&&poid;
		 break;
	}
	if(condition )
	      return true;
else{
	   
	   return false;
	}
}