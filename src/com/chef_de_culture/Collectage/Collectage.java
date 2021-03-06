package com.chef_de_culture.Collectage;

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
 * Servlet implementation class Collectage
 * for the agriculture farm manager project
 * Software technology
 */
public class Collectage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();

    /**
     * Default constructor
     */
    public Collectage() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>List of the Picking</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef de culture/en_tete.jsp").include(request,response);
		out.println("<h1>This is the list of Picking </h1>");
		out.println("<form name=\"f\" action=\"Collectage\">");
		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>choose a code</legend>");
		out.println("<label>Picking</label> ");
		out.println("<select name=\"cueillette\">");
		out.println("<option value='-1'>Any</option>");

			resultat=connexion.getData("select CODECUEIL from cueillette");
			for(int i=0;i<resultat.size();++i)
			{
	  			resultat_final=(Vector)resultat.elementAt(i);
				out.println("<option value=\""+resultat_final.elementAt(0)+"\">"+resultat_final.elementAt(0)+"</option>");
			}

		out.println("</select>");
		out.println("<div id='cueillette'>");
		out.println("<table>");
		out.println("<br>");


			 resultat=connexion.getData("SELECT * FROM cueillette WHERE CODECUEIL="+request.getParameter("cueillette")+" ORDER BY CODECUEIL");

			 for(int i=0;i<resultat.size();++i)
				{
		  			resultat_final=(Vector)resultat.elementAt(i);
					out.println("<tr><th >Code de picking</th><td>"+resultat_final.elementAt(0)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Date of picking</th><td>"+resultat_final.elementAt(2)+"</td></tr>");
					out.println("<tr><th>Poids calibre1</th><td>"+resultat_final.elementAt(6)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Weight caliber2</th><td>"+resultat_final.elementAt(7)+"</td></tr>");
					out.println("<tr><th>Poids calibre3</th><td>"+resultat_final.elementAt(8)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Weight caliber4</th><td>"+resultat_final.elementAt(9)+"</td></tr>");
					out.println("<tr><th>Qualit� de cuiellete</th><td>"+resultat_final.elementAt(3)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th> Total Weigth</th><td>"+resultat_final.elementAt(4)+"</td></tr>");
					out.println("<tr><th>Nombre Employ�s</th><td>"+resultat_final.elementAt(5)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>The coordinates of  X1</th><td>"+resultat_final.elementAt(12)+"</td></tr>");
					out.println("<tr><th>Coordonn�e X2</th><td>"+resultat_final.elementAt(13)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Coordonn�e Y1</th><td>"+resultat_final.elementAt(14)+"</td></tr>");
					out.println("<tr><th>Coordonn�e Y2</th><td>"+resultat_final.elementAt(15)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Observation List of Diseases</th><td><textarea  rows=2 cols=20  disabled style=\"height:91px;width:330px;margin-bottom: 0px\">"+resultat_final.elementAt(10)+"</textarea></td></tr>");
					out.println("<tr><th>Observation G�nerale</th><td><textarea disabled style=\"height:91px;width:330px;margin-bottom: 0px\">"+resultat_final.elementAt(11)+"</textarea></td></tr>");
				}


	out.println("</table>");
	out.println("</div>");
	out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef de culture/menu.jsp").include(request,response);
	request.getRequestDispatcher("pied.jsp").include(request,response);
	out.println("</html>");
}
}