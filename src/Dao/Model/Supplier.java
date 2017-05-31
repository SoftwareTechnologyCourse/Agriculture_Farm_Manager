package Dao.Model;

public class Supplier {
	private int idSupplier;
	private String name;
	private String prenoun;
	private String adress;
	private String email;
	private int tel;
	private String companyName;
	public Supplier(int idSupplier, String name, String prenoun, String adress, String email, int tel,
			String companyName) {
		super();
		this.idSupplier = idSupplier;
		this.name = name;
		this.prenoun = prenoun;
		this.adress = adress;
		this.email = email;
		this.tel = tel;
		this.companyName = companyName;
	}
	public Supplier() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdSupplier() {
		return idSupplier;
	}
	public void setIdSupplier(int idSupplier) {
		this.idSupplier = idSupplier;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrenoun() {
		return prenoun;
	}
	public void setPrenoun(String prenoun) {
		this.prenoun = prenoun;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Override
	public String toString() {
		return "Supplier [idSupplier=" + idSupplier + ", name=" + name + ", prenoun=" + prenoun + ", adress=" + adress
				+ ", email=" + email + ", tel=" + tel + ", companyName=" + companyName + "]";
	}
	
	
}
