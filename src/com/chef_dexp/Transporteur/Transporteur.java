package com.chef_dexp.Transporteur;
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
 * Servlet implementation class Acheteur
 */
public class Transporteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Transporteur() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html >");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Carrier Consultation</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef d'exploitation/header.jsp").include(request,response);
		out.println("<h1>Here is the list of carrier  </h1>");
		out.println("<form name=\"f\" action=\"Transporteur\">");

		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choose a name</legend>");
		out.println("<label>Carrier</label> ");
		out.println("<select name=\"Transporteur\"  >"); 
		out.println("	<option value='-1'>Any</option>");
		 
			resultat=connexion.getData("select CODETRAN,nom from Transporteur");
			for(int i=0;i<resultat.size();++i)
			{
	  			resultat_final=(Vector)resultat.elementAt(i);
				out.println("<option value=\""+resultat_final.elementAt(0)+"\">"+resultat_final.elementAt(1)+"</option>");
			}
			
		out.println("</select>"); 
		out.println("<div id='Transporteur' >"); 
		out.println("<table border=1 width=100% bordercolor=black>");
		out.println("<br>");
		
			
			 resultat=connexion.getData("SELECT * FROM Transporteur WHERE CODETRAN="+request.getParameter("Transporteur")+" ORDER BY nom");
			 for(int i=0;i<resultat.size();++i)
			 {
				 resultat_final=(Vector)resultat.elementAt(i);
				
				
					out.println("<tr><th>Carrier's code </th><td>"+resultat_final.elementAt(0)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Carrier's name </th><td>"+resultat_final.elementAt(1)+"</td></tr>");
					out.println("<tr><th>Company</th><td>"+resultat_final.elementAt(2)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Adress</th><td>"+resultat_final.elementAt(3)+"</td></tr>");
					out.println("<tr><th>Email</th><td>"+resultat_final.elementAt(4)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Fax Number </th><td>"+resultat_final.elementAt(5)+"</td></tr>");
					out.println("<tr><th>Phone number</th><td>"+resultat_final.elementAt(6)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Patent</th><td>"+resultat_final.elementAt(8)+"</td></tr>");
					out.println("<tr><th>Informations</th><td><textarea name=Acheteur  width=100% disabled style=\"height:91px;width:400px;margin-bottom: 0px\">"+resultat_final.elementAt(7)+"</textarea></td></tr>");
				
				}
			
	
	out.println("</table>");
	out.println("</div>");
	out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\">");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef d'exploitation/menu.jsp").include(request,response);
	request.getRequestDispatcher("footer.jsp").include(request,response);
	out.println("</html>");
}
}