package Dao.Interfaces;

public interface AgentInterface {

	public void addFarmers();
	public void sellProduct();
	public void buyProduct();
	void logIn(String userN, String passw);
	void addProducts(String code, String stock, String name);
	
}
