package sist.com.bm;


public class StoreLatterBean {

	private int    no;
	private String title;
	private String contents;
	private String regdate;
	private String img;
	private String ownerno;
	private String storeproductcode;
	private String storeproductname;
	private int    orderno;
	public StoreLatterBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreLatterBean(int no, String title, String contents, String regdate, String img, String ownerno,
			String storeproductcode, String storeproductname, int orderno) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
		this.img = img;
		this.ownerno = ownerno;
		this.storeproductcode = storeproductcode;
		this.storeproductname = storeproductname;
		this.orderno = orderno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}
	public String getStoreproductcode() {
		return storeproductcode;
	}
	public void setStoreproductcode(String storeproductcode) {
		this.storeproductcode = storeproductcode;
	}
	public String getStoreproductname() {
		return storeproductname;
	}
	public void setStoreproductname(String storeproductname) {
		this.storeproductname = storeproductname;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	@Override
	public String toString() {
		return "StoreLatterBean [no=" + no + ", title=" + title + ", contents=" + contents + ", regdate=" + regdate
				+ ", img=" + img + ", ownerno=" + ownerno + ", storeproductcode=" + storeproductcode
				+ ", storeproductname=" + storeproductname + ", orderno=" + orderno + "]";
	}
	
}
