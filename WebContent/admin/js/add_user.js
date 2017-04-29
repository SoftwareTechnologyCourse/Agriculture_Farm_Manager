/**
 * 
 */

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