package sist.com.bm;

public class BmBasketBean {
	
	private int    no;
	private int    ownerno;
	private String productcode;
	private int    productquantity;
	private String productname;
	private int    productprice;
	private String productimage;
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
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	@Override
	public String toString() {
		return "BmBasketBean [no=" + no + ", ownerno=" + ownerno + ", productcode=" + productcode + ", productquantity="
				+ productquantity + ", productname=" + productname + ", productprice=" + productprice
				+ ", productimage=" + productimage + "]";
	}
	
	
	
}
