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
		String url = "jdbc:mysql://localhost/gfadatabase";

		// Driver charging
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			System.out.println("The class " + Driver + "Is unfound");
			e.printStackTrace();
		}
		// Connect to the data base
		try {
			conn = DriverManager.getConnection(url, "root", "");
			state = conn.createStatement();
			System.out.println("Connexion done !");
		} catch (SQLException sqle) {
			System.out.println("COnnexion failed");
		}

	}
	// Add data to the data base

	public void setData(String requette) {
		try {
			state.executeUpdate(requette);
			Commit();
		} catch (SQLException ex) {
			ex.getMessage();
		}

	}

	// Get data from the data base
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
			System.out.println("Error in the  getresultat(...)");
		}

		return resultat_principal;
	}

	public void Commit() throws SQLException {
		conn.commit();
	}

	public void close() throws SQLException {
		// Close connexion
		result.close();
		state.close();
		conn.close();
	}

}