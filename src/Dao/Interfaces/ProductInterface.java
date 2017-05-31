package Dao.Interfaces;

public interface ProductInterface {
	
	public void checkProduct();
	public void sellProduct();
	public void buyProduct();
	public Double getProceProduct();
	public String getExpireDateProduct();
	void createProduct(String code, String stock, String name);
	
}
