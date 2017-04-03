package com.Agent.OutStock;

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
 * Servlet implementation class OutStock
 * The outstock of the project agriculture farm manager
 */
public class OutStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion = new Connect();

	/**
	 * Default constructor
	 */
	public OutStock() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Consultation of stock out </title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("Agent/hader.jsp").include(request, response);
		out.println("<h1>This is the list of stock Out </h1>");
		out.println("<form name=\"f\" action=\"OutStock\">");
		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choisir un Stock</legend>");
		out.println("<label>Stocks out</label> ");
		out.println("<select name=\"OutStock\">");
		out.println("<option value='-1'>Aucun</option>");

		resultat = connexion.getData("select CODESTOCKE from OutStocke");
		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);
			out.println("<option value=\"" + resultat_final.elementAt(0) + "\">" + resultat_final.elementAt(0) + "</option>");
		}
		out.println("</select>");out.println("<div id='InStock'>");out.println("<table>");out.println("<br>");
		resultat = connexion.getData("SELECT * FROM OutStocke WHERE CODESTOCKE=" + request.getParameter("OutStock"));

		for (int i = 0; i < resultat.size(); ++i) {
			resultat_final = (Vector) resultat.elementAt(i);
			out.println("<tr><th >stock code</th><td>" + resultat_final.elementAt(0) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Quantité</th><td>" + resultat_final.elementAt(1)
					+ "</td></tr>");
			out.println("<tr><th>Shop</th><td>" + resultat_final.elementAt(2) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Agent</th><td>" + resultat_final.elementAt(3)
					+ "</td></tr>");
			out.println("<tr><th>Designiation</th><td>" + resultat_final.elementAt(5) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th>Tache</th><td>" + resultat_final.elementAt(6)
					+ "</td></tr>");
			out.println("<tr><th>Date of the stock out</th><td>" + resultat_final.elementAt(7) + "</td></tr>");
			out.println("<tr style=\"background-color:#DAFAC9;\"><th >Produit</th><td>" + resultat_final.elementAt(8)
					+ "</td></tr>");
			out.println("<tr><th >The Machine</th><td>" + resultat_final.elementAt(9) + "</td></tr>");
			out.println("<tr><th>Observation </th><td><textarea disabled style=\"height:91px;width:330px;margin-bottom:0px;overflow:auto\">"
							+ resultat_final.elementAt(4) + "</textarea></td></tr>");
		}
		out.println("</table>");
		out.println("</div>");
		out.println(
				"<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
		out.println("</fieldset>");
		out.println("</form>");
		out.println("</body>");
		request.getRequestDispatcher("Agent/menu.jsp").include(request, response);
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</html>");
	}
}
