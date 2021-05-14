package sist.com.bm;

public class BmSupportBean {
	private String name;
	private String supportarea;
	private int    supportprice;
	@Override
	public String toString() {
		return "BmSupportBean [name=" + name + ", supportarea=" + supportarea + ", supportprice=" + supportprice + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSupportarea() {
		return supportarea;
	}
	public void setSupportarea(String supportarea) {
		this.supportarea = supportarea;
	}
	public int getSupportprice() {
		return supportprice;
	}
	public void setSupportprice(int supportprice) {
		this.supportprice = supportprice;
	}
	
	
}
