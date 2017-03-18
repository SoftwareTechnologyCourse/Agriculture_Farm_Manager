package ma.connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class Connect {
	Connection conn = null;
	Statement state = null;
	ResultSet result = null;
	
	public Connect() {

		String Driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://localhost/FarmBD";

		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			System.out.println("The class " + Driver + "not found");
			e.printStackTrace();
		}
		// Connect to the data base
		try {
			conn = DriverManager.getConnection(url, "root", "");
			state = conn.createStatement();
			System.out.println("The connexion succeed");
		} catch (SQLException sqle) {
			System.out.println("Connexion error");
		}
	}
	
	// Add modifications to data
	public void setData(String requette) {
		try {
			state.executeUpdate(requette);
			Commit();
		} catch (SQLException ex) {
			ex.getMessage();
		}
	}

	// get data
	public Vector getData(String requet) {
		Vector resultat_principal = new Vector();
		Vector resultat;
		resultat_principal.removeAllElements();
		try {
			result = state.executeQuery(requet);
			ResultSetMetaData rsmd = result.getMetaData();
			int nbCols = rsmd.getColumnCount();
			boolean encore = result.next();

			while (encore) {
				resultat = new Vector();

				for (int i = 1; i <= nbCols; i++)
					resultat.addElement(result.getString(i));

				resultat_principal.addElement(resultat);
				resultat = null;
				encore = result.next();
			}
			result.close();
		} catch (SQLException e) {
			System.out.println("Error in getresultat(...)");
		}

		return resultat_principal;
	}
	
	
	public void Commit() throws SQLException {
		conn.commit();
	}
	
	//Close connexion
	public void close() throws SQLException {
		result.close();
		state.close();
		conn.close();
	}
	
	
}
