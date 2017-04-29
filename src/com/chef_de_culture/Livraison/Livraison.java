package com.chef_de_culture.Livraison;

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
 * Servlet implementation class Livraison
 * for the agriculture farm manager project
 * Software technology
 */
public class Livraison extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor.
     */
    public Livraison() {
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
		out.println("<title>Consultation des Acheteurs</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef de culture/header.jsp").include(request,response);
		out.println("<h1>This is the list of delivery </h1>");
		out.println("<table cellspacing=0 cellpadding=4 rules=all  border=1 style=\"background-color:White;border-color:#3366CC;border-width:1px;border-style:None;width:500px;border-collapse:collapse;\">");
		out.println("<br>");
		out.println("<tr style=\"color:#CCCCFF;background-color:#003399;font-weight:bold;\">");
		out.println("<th>Num�ro de Livraison</th>");
		out.println("<th>Code of culture </th>");
		out.println("<th>delivery date</th>");
		out.println("<th>weight Net</th>");
		out.println("<th>Number of Gadget</th>");
		out.println("<th>code of the carrier</th>");
		out.println("</tr>");
		resultat=connexion.getData("SELECT * from livraison ");

				for(int i=0;i<resultat.size();++i)
				{
					resultat_final=(Vector)resultat.elementAt(i);
					out.println("<tr>");
					for(int j=0;j<resultat_final.size();j++)
					{
					out.println("<td>"+resultat_final.elementAt(j)+"</td>");
				}
				out.println("</tr>");
				}


	out.println("</table>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef de culture/menu.jsp").include(request,response);
	request.getRequestDispatcher("footer.jsp").include(request,response);
	out.println("</html>");
}
}