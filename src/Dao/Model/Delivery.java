package Dao.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="livraison")
public class Delivery {
	@Id
	@Column(name="id")
	private String idDelivery;
	@Column(name="NOMLivreur")
	private String name;
	@ManyToOne
	private int supplierID;
	public Delivery(String idDelivery, String name, int supplierID) {
		super();
		this.idDelivery = idDelivery;
		this.name = name;
		this.supplierID = supplierID;
	}
	public String getIdDelivery() {
		return idDelivery;
	}
	public void setIdDelivery(String idDelivery) {
		this.idDelivery = idDelivery;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	@Override
	public String toString() {
		return "Delivery [idDelivery=" + idDelivery + ", name=" + name + ", supplierID=" + supplierID + "]";
	}
	
	
	
}
