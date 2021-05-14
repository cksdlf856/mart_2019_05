package sist.com.bm;

public class BmMyPageBean {

	private int no;
	private int ownerno;
	private String productcode;
	private int productquantity;
	private String productname;
	private int productprice;
	private String orderdate;
	private String delevery;
	private int latterChk;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(int ownerno) {
		this.ownerno = ownerno;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public int getProductquantity() {
		return productquantity;
	}
	public void setProductquantity(int productquantity) {
		this.productquantity = productquantity;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getDelevery() {
		return delevery;
	}
	public void setDelevery(String delevery) {
		this.delevery = delevery;
	}
	public int getLatterChk() {
		return latterChk;
	}
	public void setLatterChk(int latterChk) {
		this.latterChk = latterChk;
	}
	@Override
	public String toString() {
		return "BmMyPageBean [no=" + no + ", ownerno=" + ownerno + ", productcode=" + productcode + ", productquantity="
				+ productquantity + ", productname=" + productname + ", productprice=" + productprice + ", orderdate="
				+ orderdate + ", delevery=" + delevery + ", latterChk=" + latterChk + "]";
	}
	
	
}
