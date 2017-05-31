package Dao.Model;

public class Greenhouses {
	private int idGH;
	private Double area;
	private String owner;
	private String plants;
	public Greenhouses() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Greenhouses(int idGH, Double area, String owner, String plants) {
		super();
		this.idGH = idGH;
		this.area = area;
		this.owner = owner;
		this.plants = plants;
	}
	@Override
	public String toString() {
		return "Greenhouses [idGH=" + idGH + ", area=" + area + ", owner=" + owner + ", plants=" + plants + "]";
	}
	public int getIdGH() {
		return idGH;
	}
	public void setIdGH(int idGH) {
		this.idGH = idGH;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getPlants() {
		return plants;
	}
	public void setPlants(String plants) {
		this.plants = plants;
	}
	
	
}
