


 
<div id="content">
<!-- header begins -->
<div id="header">
	<div id="logo">
		<h1><a href="#">Gestion Agriculture</a></h1>
		<h2><a href="http://www.metamorphozis.com/" id="metamorph">d'une ferme</a></h2>
	</div>

<ul id="nav">

	<li id="first">
		<div class="divlink"><a>mon profil</a></div>
		<ul>
		<li><a href="<%=request.getContextPath()+"/admin/index.jsp"%>">mon compte</a></li>
			<li><a href="<%=request.getContextPath()+"/admin/modifier_password.jsp"%>">modifier mon mot de passe</a></li>
		</ul>
	</li>

	<li>
		<div class="divlink"><a href="<%=request.getContextPath()+"/admin/add_user.jsp"%>">ajouter</a></div>
	</li>

	<li>
		<div class="divlink"><a href="<%=request.getContextPath()+"/Utilisateur"%>">consulter</a></div>
	</li>

	<li>
		<div class="divlink"><a href="<%=request.getContextPath()+"/index.jsp?b=decon"%>">se deconnecter</a></div>
	</li>
</ul>
</div>
<div id=right>
