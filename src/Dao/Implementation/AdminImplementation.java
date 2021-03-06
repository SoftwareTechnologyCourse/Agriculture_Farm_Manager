package Dao.Implementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Dao.Interfaces.AdminInterface;

public class AdminImplementation implements AdminInterface{
	private String URL;
	private String username;
	private String password;
	
	Connection conn = null;
	Statement state = null;
	ResultSet result = null;
	
	public void connect(){
		String Driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://localhost/gfadatabase";
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
	
	@Override
	public void logIn(String userN, String passw) {
		connect();
		String req = "select ID, password from user";
		try {
			conn.createStatement();
			ResultSet result = state.executeQuery(req);
			String usernamee = result.getString("ID");
			String password = result.getString("password");
			if(usernamee.equals(userN)&password.equals(passw)){
				System.out.println("ConnexionDone !");
			}else{
				System.out.println("connexion Failed");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void createAdmin(String id, String usermae,String password,String role, String email) {
		connect();
		String req = "insert into user values '"+id+"',"+"'"+username+"',"+"'"+password+"',"+"'"+role+"',"+"'"+email+"',";
		try {
			ResultSet result = state.executeQuery(req);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void passwordUpdate() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUsers(int id) {
		connect();
		String req = "delete user where id='"+id+"'";
		try {
			ResultSet res = state.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
