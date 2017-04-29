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
					<a>My Profile</a>
				</div>
				<ul>
					<li><a
						href="<%=request.getContextPath() + "/admin/index.jsp"%>">My
							Account</a></li>
					<li><a
						href="<%=request.getContextPath() + "/admin/modifier_password.jsp"%>">Password
							Update</a></li>
				</ul>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath() + "/admin/add_user.jsp"%>">Add</a>
				</div>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath() + "/Utilisateur"%>">Display</a>
				</div>
			</li>

			<li>
				<div class="divlink">
					<a href="<%=request.getContextPath() + "/index.jsp?b=decon"%>">Deconnect</a>
				</div>
			</li>
		</ul>
	</div>
	<div id=right>