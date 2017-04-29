<div id="content">
	<!-- header begins -->
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">Agriculture Farm</a>
			</h1>
			<h2>
				<a href="" id="metamorph">Management</a>
			</h2>
		</div>

		<ul id="nav">

			<li id="first">
				<div class="divlink">
					<a href="">Home</a>
				</div>
				<ul>
					<li><a
						href="<%=request.getContextPath() + "/chef de culture/index.jsp"%>">My
							account</a></li>
					<li><a
						href="<%=request.getContextPath() + "/chef de culture/modifier_password.jsp"%>">Password
							update</a></li>
				</ul>
			</li>

			<li>
				<div class="divlink">
					<a
						href="<%=request.getContextPath() + "/chef de culture/ajouter.jsp"%>">Add</a>
				</div>
			</li>

			<li>
				<div class="divlink">
					<a href="">consulter</a>
				</div>
				<ul>

					<li><a href="<%=request.getContextPath() + "/Collectage"%>">Gathering</a></li>
					<li><a href="<%=request.getContextPath() + "/Plantation"%>">Planting</a></li>
					<li><a href="<%=request.getContextPath() + "/Traitement"%>">Treatment</a></li>
					<li><a href="<%=request.getContextPath() + "/Livraison"%>">Delivery</a></li>
				</ul>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath()+"/index.jsp?b=decon"%>">Deconnect</a>
				</div>

			</li>


		</ul>


	</div>
	<div id=right>