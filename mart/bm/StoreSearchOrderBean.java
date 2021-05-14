package sist.com.bm;

public class StoreSearchOrderBean {

	private String productName;
	private String category;
	private String made;
	private int firstMoney;
	private int secondMoney;
	private String firstDay;
	private String secondDay;
	private int orderNum;
	private String orderBy;
	private int page;
	private int start;
	private int end;
	public StoreSearchOrderBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreSearchOrderBean(String productName, String category, String made, int firstMoney, int secondMoney,
			String firstDay, String secondDay, int orderNum, String orderBy, int page, int start, int end) {
		super();
		this.productName = productName;
		this.category = category;
		this.made = made;
		this.firstMoney = firstMoney;
		this.secondMoney = secondMoney;
		this.firstDay = firstDay;
		this.secondDay = secondDay;
		this.orderNum = orderNum;
		this.orderBy = orderBy;
		this.page = page;
		this.start = start;
		this.end = end;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
	public int getFirstMoney() {
		return firstMoney;
	}
	public void setFirstMoney(int firstMoney) {
		this.firstMoney = firstMoney;
	}
	public int getSecondMoney() {
		return secondMoney;
	}
	public void setSecondMoney(int secondMoney) {
		this.secondMoney = secondMoney;
	}
	public String getFirstDay() {
		return firstDay;
	}
	public void setFirstDay(String firstDay) {
		this.firstDay = firstDay;
	}
	public String getSecondDay() {
		return secondDay;
	}
	public void setSecondDay(String secondDay) {
		this.secondDay = secondDay;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "StoreSearchOrderBean [productName=" + productName + ", category=" + category + ", made=" + made
				+ ", firstMoney=" + firstMoney + ", secondMoney=" + secondMoney + ", firstDay=" + firstDay
				+ ", secondDay=" + secondDay + ", orderNum=" + orderNum + ", orderBy=" + orderBy + ", page=" + page
				+ ", start=" + start + ", end=" + end + "]";
	}
}
