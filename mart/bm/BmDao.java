package sist.com.bm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.com.bm.BmBasketBean;
import sist.com.bm.BmCouponBean;
import sist.com.bm.BmSupportBean;

@Repository(value="bmDao")
public class BmDao extends SqlSessionDaoSupport {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<BmBasketBean> basketSelect(){
		return this.getSqlSession().selectList("basketSelect");		
	}
	
	public void basketDelete(int no){
		this.getSqlSession().delete("basketDelete", no);
	}
	
	public void basketModi(int no,int quantity){
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("no", no);
		map.put("productquantity", quantity);
		
		this.getSqlSession().update("basketModi", map);
	}
	
	public void basketInsert(BmBasketBean bean){
		this.getSqlSession().insert("basketInsert", bean);
	}
	
	public List<BmBasketBean> orderListToBasket(int[]no){//장바구니에서 선택한 상품이 no로 와서 list에 담고 DB로 보낸다.
		
		List<Integer>list=new ArrayList<Integer>();
		
		for(int i:no){
			
			list.add(i);		
		}
		 return this.getSqlSession().selectList("orderListToBasket", list);
	}
	
	public List<BmSupportBean> supportSelect(){//후원 테이블에서 후원정보 찾아오기
		
		return this.getSqlSession().selectList("supportSelect");
	}
	
	public void couponInsert(BmCouponBean bean){//특정 사장님에게 쿠폰 추가하기
		System.out.println(bean);
		this.getSqlSession().insert("couponInsert",bean);
	}
	
	public HashMap<String, Object> couponSelect(int currentpage){//현재페이지의 수 뷰에서 누른 현재페이지 번호를 가져오면 된다.
		
		int pageshowcount=3;
		int totalpagecount=this.getSqlSession().selectOne("couponTotalSelect");//총 쿠폰 개수
		int totalpage=(totalpagecount%pageshowcount)==0?(totalpagecount/pageshowcount):(totalpagecount/pageshowcount)+1;//총 페이지
		int start=((currentpage-1)*pageshowcount)+1;//한 페이지에 들어갈 첫번째 상품
		int end=pageshowcount*currentpage;//한 페이지에 들어갈 마지막 상품
		
		HashMap<String, Object> map=new HashMap<String, Object>();//쿼리에 처음 상품과 마지막 상품을 찾아오기 위해 씀
		map.put("start", start);
		map.put("end", end);
		
		HashMap<String, Object> map2=new HashMap<String, Object>();//찾아온 쿠폰리스트와 총 페이지를 담기위해 씀
		map2.put("list", this.getSqlSession().selectList("couponSelect", map));
		map2.put("totalpage", totalpage);
		
		return map2;
	}
	
	public void productOrderInsert(BmBasketBean bean){//주문 테이블로 넣는곳
		System.out.println(bean);
		this.getSqlSession().insert("productOrderInsert", bean);
      
	}
	
	public List<BmMyPageBean> myPageSelect(HashMap<String, Object>map){//주문테이블 에서 주문한 상품들  찾아오기
		
		return this.getSqlSession().selectList("myPageSelect",map);
	}
	
	public void supportPriceInsert(int supportprice,int ownerno,String condition){//사장님 번호로 후원적립금을 인설트 해줌
		int sumSupportPrice=0;
		System.out.println(supportprice+","+ownerno+","+condition);
		if(condition.equals("sum")){
		 sumSupportPrice= supportRriceSelect(ownerno)+supportprice;//기존에 있는 후원적립금과 추가할 후원적립금을 더해준다.
		}else if(condition.equals("minus")){
		 sumSupportPrice= supportRriceSelect(ownerno)-supportprice;//기존에 있는 후원적립금과 추가할 후원적립금을 더해준다.
		}
		System.out.println("supportPriceInsert,"+sumSupportPrice);
		System.out.println("supportPriceInsert,"+ownerno);
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("supportprice", sumSupportPrice);
		map.put("ownerno", ownerno);
		
		 this.getSqlSession().update("supportPriceInsert", map);
	}
	
	public int supportRriceSelect(int ownerno){//사장님 번호로 총 후원적립금을 뽑아옴
		System.out.println("supportRriceSelect,"+ownerno);
		System.out.println("supportRriceSelect,"+this.getSqlSession().selectOne("supportRriceSelect", ownerno));
		return this.getSqlSession().selectOne("supportRriceSelect", ownerno);
	}
	
	public int orderDiscountSelect(int ownerno){//사장님 주문 목록에서 주문한 상품들 총 합을 가져옴
		
		System.out.println("---------------"+this.getSqlSession().selectOne("orderDiscountSelect", ownerno));
		Object cg=this.getSqlSession().selectOne("orderDiscountSelect", ownerno);
		
		if(cg==null){
			return 0;
		}else{
			return this.getSqlSession().selectOne("orderDiscountSelect", ownerno);
		}
		
	}
	
	public int selectSupportPrice(String name,int supportPrice){//후원테이블 에서 이름을 이용해 적립금을 찾고 더해준 후 다시 넣어준다.
		System.out.println(name);
		System.out.println(this.getSqlSession().selectOne("selectSupportPrice", name.trim()));
		int sumSupportPrice=(Integer)(this.getSqlSession().selectOne("selectSupportPrice", name.trim()))+supportPrice;//db후원금과 추가되는 후원금 합쳐줌
		System.out.println(sumSupportPrice);
		
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("supportprice", sumSupportPrice);
		map.put("name", name);
		
		this.getSqlSession().update("selectSupportPriceUpdate", map);//합쳐진 후원금을 다시 db로 넣어줌.업데이트
		return this.getSqlSession().selectOne("selectSupportPrice", name);//그리고 다시 합쳐진 후원금은 가져옴.
	}
	
	
}
