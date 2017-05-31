package Dao.Model;

public class Product {
	private int id;
	private String name;
	private String type;
	private String supplier;
	private String dateProducing;
	private String dateExpire;
	private int code;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id, String name, String type, String supplier, String dateProducing, String dateExpire,
			int code) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.supplier = supplier;
		this.dateProducing = dateProducing;
		this.dateExpire = dateExpire;
		this.code = code;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", type=" + type + ", supplier=" + supplier + ", dateProducing="
				+ dateProducing + ", dateExpire=" + dateExpire + ", code=" + code + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getDateProducing() {
		return dateProducing;
	}
	public void setDateProducing(String dateProducing) {
		this.dateProducing = dateProducing;
	}
	public String getDateExpire() {
		return dateExpire;
	}
	public void setDateExpire(String dateExpire) {
		this.dateExpire = dateExpire;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	
}
