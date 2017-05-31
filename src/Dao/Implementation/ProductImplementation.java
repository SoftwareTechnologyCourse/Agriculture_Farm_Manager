package Dao.Implementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Dao.Interfaces.ProductInterface;

public class ProductImplementation implements ProductInterface{

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
	public void createProduct(String code, String stock, String name) {
		connect();
		
		String req = "insert into product values '"+code+"',"+"'"+stock+"',"+"'"+name+"'";
		try {
			ResultSet result = state.executeQuery(req);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void checkProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sellProduct(int id) {
		connect();
		String req = "select * from product where id ='"+id+"'";
		try {
			ResultSet res = state.executeQuery(req);
			int idProduct = Integer.parseInt(res.getString("ID"));
			String req2 = "delete product where id='"+idProduct+"'";
			state.execute(req2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void buyProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Double getProceProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getExpireDateProduct() {
		return null;
	}
	
}
