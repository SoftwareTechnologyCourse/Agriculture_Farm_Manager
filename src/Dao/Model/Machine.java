package Dao.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.javafx.beans.IDProperty;

@Entity
@Table(name="Machine")
public class Machine {
	@Id
	@Column(name="CODEMACHINE")
	private int idM;
	private String type;
	private int age;
	private String owner;
	private double price;
	private String role;
	public Machine() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Machine(int idM, String type, int age, String owner, double price, String role) {
		super();
		this.idM = idM;
		this.type = type;
		this.age = age;
		this.owner = owner;
		this.price = price;
		this.role = role;
	}
	public int getIdM() {
		return idM;
	}
	public void setIdM(int idM) {
		this.idM = idM;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Machine [idM=" + idM + ", type=" + type + ", age=" + age + ", owner=" + owner + ", price=" + price
				+ ", role=" + role + "]";
	}
	
	
}
