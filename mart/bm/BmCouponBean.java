package sist.com.bm;

public class BmCouponBean {
	private int no;
	private int ownerno; 
	private double discount; 
	private String cname;
	private String enddate;
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
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "BmCouponBean [no=" + no + ", ownerno=" + ownerno + ", discount=" + discount + ", cname=" + cname
				+ ", enddate=" + enddate + "]";
	}
	
	
	
}