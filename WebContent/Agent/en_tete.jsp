

<div id="content">
	<!-- header begins -->
	<div id="header">
		<div id="logo">
			<h1>
				<a>Agriculture Farm</a>
			</h1>
			<h2>Management</h2>
		</div>

		<ul id="nav">

			<li id="first">
				<div class="divlink">
					<a>Home</a>
				</div>
				<ul>
					<li><a href="<%=request.getContextPath() + "/Agent/index.jsp"%>">My
							Account</a></li>
					<li><a
						href="<%=request.getContextPath() + "/Agent/modifier_password.jsp"%>">Password
							update</a></li>
				</ul>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath() + "/Agent/ajouter.jsp"%>">Add</a>
				</div>
			</li>

			<li>
				<div class="divlink">
					<a>Consultation</a>
				</div>
				<ul>
					<li><a href="<%=request.getContextPath() + "/InStock"%>">Stock
							In</a></li>
					<li><a href="<%=request.getContextPath() + "/OutStock"%>">stock
							Out</a></li>
					<li><a href="<%=request.getContextPath() + "/Produit"%>">Product</a></li>
					<li><a href="<%=request.getContextPath() + "/Ennemie"%>">ennemie</a></li>
					<li><a href="<%=request.getContextPath() + "/Machine"%>">machine</a></li>
				</ul>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath()+"/index.jsp?b=decon"%>">
						Deconnect</a>
				</div>

			</li>
		</ul>
	</div>
	<div id=right>