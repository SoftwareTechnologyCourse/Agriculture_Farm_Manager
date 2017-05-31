package Dao.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.javafx.beans.IDProperty;

@Entity
@Table(name="USER")
public class FarmerManager {
	@Id
	@Column(name="ID")
	private int id;
	
	@Column(name="NOMUSER")
	private String name;
	private String prenoun;
	private String adress;
	private int Tel;
	private int fax;
	private String date;
	@Column(name="EMAILUSER")
	private String email;
	public FarmerManager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FarmerManager(int id, String name, String prenoun, String adress, int tel, int fax, String date,
			String email) {
		super();
		this.id = id;
		this.name = name;
		this.prenoun = prenoun;
		this.adress = adress;
		Tel = tel;
		this.fax = fax;
		this.date = date;
		this.email = email;
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
	public int getTel() {
		return Tel;
	}
	public void setTel(int tel) {
		Tel = tel;
	}
	public int getFax() {
		return fax;
	}
	public void setFax(int fax) {
		this.fax = fax;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "FarmerManager [id=" + id + ", name=" + name + ", prenoun=" + prenoun + ", adress=" + adress + ", Tel="
				+ Tel + ", fax=" + fax + ", date=" + date + ", email=" + email + "]";
	}
	
	
}
