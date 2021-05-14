package sist.com.bm;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.com.bm.StoreLatterBean;
import sist.com.bm.StoreOrderBean;
import sist.com.bm.StoreProductBean;
import sist.com.bm.StoreSearchOrderBean;
import sist.com.bm.BmMyPageBean;

@Repository(value="storeDao")
public class StoreDao extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//public List<StoreOrderBean> orderListSelect(String ownerno,int start,int end){//mypage에서 해당사장님의 전체 주문내역을 가져오는 메소드
	//	HashMap<String, Object>map =new HashMap<String, Object>();
		//map.put("ownerno", ownerno);
		//map.put("start", start);
		//map.put("end", end);
		//return this.getSqlSession().selectList("orderListSelect",map);
	//}
	public String orderListGetProductName(String code){
		return this.getSqlSession().selectOne("orderListGetProductName", code);
	}
	public String orderExtendedPrice(String ownerno){
		return this.getSqlSession().selectOne("orderExtendedPrice", ownerno);
	}
	public int orderCartEa(String ownerno){
		return this.getSqlSession().selectOne("orderCartEa", ownerno);
	}
	public List<StoreLatterBean>latterListProcess(HashMap<String, Object>map){
		return this.getSqlSession().selectList("latterListProcess",map);
	}
	public Integer getTotalRowLatter(){
		return this.getSqlSession().selectOne("getTotalRowLatter");
	}
	public List<StoreLatterBean>latterChkProcess(){
		return this.getSqlSession().selectList("latterChkProcess");
	}
	public BmMyPageBean latterWriteDao(int orderno){
		
		return this.getSqlSession().selectOne("latterWriteDao",orderno);
	}
	public int latterPriceDao(String productCode){ //제품의 개별가격을 뽑아주는 메소드
		return this.getSqlSession().selectOne("latterPriceDao", productCode);
	}
	public void latterWriteInputDao(StoreLatterBean bean){
		this.getSqlSession().insert("latterWriteInputDao", bean);
	}
	public int productTotalCount(){
		System.out.println("-----------------------------------------------------start");
		return this.getSqlSession().selectOne("productTotalCount");
	}
	public List<StoreProductBean>productSearchDao(StoreSearchOrderBean bean){
		return this.getSqlSession().selectList("productSearchDao",bean);
	}
	public int myOrderAllCountDao(int owner){//mypage 총 주문내역의 개수를 뽑아주는 메소드

		return this.getSqlSession().selectOne("myOrderAllCountDao", owner);
	}
}
