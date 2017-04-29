package com.admin.Utilisateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.connexion.Connect;

/**
 * Servlet implementation class Utilisateur
 */
public class Utilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion = new Connect();

	/**
	 * Default constructor.
	 */
	public Utilisateur() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Consultation des Utilisateurs</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("admin/en_tete.jsp").include(request, response);
		out.println("<h1>Here is the list of users </h1>");
		out.println("<form name=\"f\" action=\"Utilisateur\">");

		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choose a name</legend>");
		out.println("<label>User</label> ");
		out.println("<select name=\"Utilisateur\"  >");
		out.println("	<option value='-1'>Any</option>");

		resultat = connexion.getData("select ID,NOMUSER from user");
		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);
			out.println("<option value=\"" + resultat_final.elementAt(0) + "\">" + resultat_final.elementAt(1)
					+ "</option>");
		}
		out.println("</select>");
		out.println("<div id='Utilisateur' >");
		out.println("<table border=1 width=100% bordercolor=black>");
		out.println("<br>");

		resultat = connexion
				.getData("SELECT * FROM user WHERE id='" + request.getParameter("Utilisateur") + "' ORDER BY id");
		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);

			out.println("<tr><th>ID of User</th><td>" + resultat_final.elementAt(0) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>User's password</th><td>"
					+ resultat_final.elementAt(1) + "</td></tr>");
			out.println("<tr><th>Email</th><td>" + resultat_final.elementAt(2) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Role</th><td>" + resultat_final.elementAt(3)
					+ "</td></tr>");
			out.println("<tr><th>Name</th><td>" + resultat_final.elementAt(4) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Grade</th><td>" + resultat_final.elementAt(5)
					+ "</td></tr>");
		}

		out.println("</table>");
		out.println("</div>");
		out.println(
				"<input type=\"submit\" value=\"Display\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
		out.println("</fieldset>");
		out.println("</form>");
		out.println("</body>");
		request.getRequestDispatcher("admin/menu.jsp").include(request, response);
		request.getRequestDispatcher("admin/pied.jsp").include(request, response);
		out.println("</html>");
	}
}