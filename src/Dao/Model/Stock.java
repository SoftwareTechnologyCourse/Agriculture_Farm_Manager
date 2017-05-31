package Dao.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="instocke")
public class Stock {
	@Id
	@Column(name="CODESTOCK")
	private int id;
	private String type;
	private String inORout;
	private String date;
	private String supplier;
	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Stock(int id, String type, String inORout, String date, String supplier) {
		super();
		this.id = id;
		this.type = type;
		this.inORout = inORout;
		this.date = date;
		this.supplier = supplier;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInORout() {
		return inORout;
	}
	public void setInORout(String inORout) {
		this.inORout = inORout;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	@Override
	public String toString() {
		return "Stock [id=" + id + ", type=" + type + ", inORout=" + inORout + ", date=" + date + ", supplier="
				+ supplier + "]";
	}
	
	
}
