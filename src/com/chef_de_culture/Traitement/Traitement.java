package com.chef_de_culture.Traitement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.connexion.Connect;

/**
 * Servlet implementation class Traitement
 * for the agriculture farm manager project
 * Software technology
 */
public class Traitement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion = new Connect();

	/**
	 * Default constructor.
	 */
	public Traitement() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(
				"<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Consultation des cueillettes</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef de culture/en_tete.jsp").include(request, response);
		out.println("<h1>this is the list of all treatments and operations </h1>");
		out.println("<form name=\"f\" action=\"Traitement\">");
		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choose a code</legend>");
		out.println("<label>Treatements and operations </label> ");
		out.println("<select name=\"Traitement\">");
		out.println("<option value='-1'>Aucun</option>");

		resultat = connexion.getData("select NUMTRAITEMENT from Traitement");
		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);
			out.println("<option value=\"" + resultat_final.elementAt(0) + "\">" + resultat_final.elementAt(0) + "</option>");
		}

		out.println("</select>");
		out.println("<div id='cueillette'>");
		out.println("<table>");
		out.println("<br>");

		resultat = connexion.getData(
				"SELECT t1 . * , s1.codeparcelle, f1.nomferme,x1.NOMCOMMERCIAL FROM traitement t1, serre s1, ferme f1,produit x1 WHERE t1.NUMTRAITEMENT="
						+ request.getParameter("Traitement")
						+ " AND t1.codeser = s1.codeser  AND x1.codeproduit=t1.codeproduit AND s1.codeparcelle IN (SELECT p1.codeparcelle FROM parcelle p1 WHERE p1.codeferme = f1.codeferme)");

		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);
			out.println("<tr  style=\"background-color:#DAFAC9;\"><th >Nom d'Exploitation</th><td>"+ resultat_final.elementAt(12) + "</td></tr>");
			out.println("<tr><th>Code of plot </th><td>" + resultat_final.elementAt(11) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Code of the Green House</th><td>" + resultat_final.elementAt(1)+ "</td></tr>");
			out.println("<tr><th>Number of treatement</th><td>" + resultat_final.elementAt(0) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Date of treatement or operation</th><td>"+ resultat_final.elementAt(2) + "</td></tr>");
			out.println("<tr><th>Time of the treatement</th><td>" + resultat_final.elementAt(3) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Type of the treatement</th><td>"+ resultat_final.elementAt(5) + "</td></tr>");
			out.println("<tr><th>quality total</th><td>" + resultat_final.elementAt(6) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>total cost of the products</th><td>"+ resultat_final.elementAt(7) + "</td></tr>");
			out.println("<tr><th>Code du Produit</th><td>" + resultat_final.elementAt(10) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Name of the product</th><td>"+ resultat_final.elementAt(13) + "</td></tr>");
			out.println("<tr><th>SURTRAI</th><td>" + resultat_final.elementAt(9) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Caterer Agent</th><td>"+ resultat_final.elementAt(8) + "</td></tr>");
			out.println("<tr><th>Observation</th><td><textarea disabled=disabled overflow:auto; style=\"height:93px;width:333px;margin-bottom:0px;overflow:auto; \">"	+ resultat_final.elementAt(4) + "</textarea></td></tr>");
		}

		out.println("</table>");
		out.println("</div>");
		out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
		out.println("</fieldset>");
		out.println("</form>");
		out.println("</body>");
		request.getRequestDispatcher("chef de culture/menu.jsp").include(request, response);
		request.getRequestDispatcher("pied.jsp").include(request, response);
		out.println("</html>");
	}
}
