package sist.com.bm;

public class StoreOrderBean {

 private int    orderno;
 private String orderdate;
 private String ownerno;
 private String storeproductcode;
 private String storeproductname;
 private int    ordercount;
 private String orderPrice;
 private String delevery;
 private int    mileage;
 private int    latterChk;
public StoreOrderBean() {
	super();
	// TODO Auto-generated constructor stub
}
public StoreOrderBean(int orderno, String orderdate, String ownerno, String storeproductcode, String storeproductname,
		int ordercount, String orderPrice, String delevery, int mileage, int latterChk) {
	super();
	this.orderno = orderno;
	this.orderdate = orderdate;
	this.ownerno = ownerno;
	this.storeproductcode = storeproductcode;
	this.storeproductname = storeproductname;
	this.ordercount = ordercount;
	this.orderPrice = orderPrice;
	this.delevery = delevery;
	this.mileage = mileage;
	this.latterChk = latterChk;
}
public int getOrderno() {
	return orderno;
}
public void setOrderno(int orderno) {
	this.orderno = orderno;
}
public String getOrderdate() {
	return orderdate;
}
public void setOrderdate(String orderdate) {
	this.orderdate = orderdate;
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
public int getOrdercount() {
	return ordercount;
}
public void setOrdercount(int ordercount) {
	this.ordercount = ordercount;
}
public String getOrderPrice() {
	return orderPrice;
}
public void setOrderPrice(String orderPrice) {
	this.orderPrice = orderPrice;
}
public String getDelevery() {
	return delevery;
}
public void setDelevery(String delevery) {
	this.delevery = delevery;
}
public int getMileage() {
	return mileage;
}
public void setMileage(int mileage) {
	this.mileage = mileage;
}
public int getLatterChk() {
	return latterChk;
}
public void setLatterChk(int latterChk) {
	this.latterChk = latterChk;
}
@Override
public String toString() {
	return "StoreOrderBean [orderno=" + orderno + ", orderdate=" + orderdate + ", ownerno=" + ownerno
			+ ", storeproductcode=" + storeproductcode + ", storeproductname=" + storeproductname + ", ordercount="
			+ ordercount + ", orderPrice=" + orderPrice + ", delevery=" + delevery + ", mileage=" + mileage
			+ ", latterChk=" + latterChk + "]";
}
}
