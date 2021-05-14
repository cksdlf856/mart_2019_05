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
	
	public List<BmBasketBean> orderListToBasket(int[]no){//��ٱ��Ͽ��� ������ ��ǰ�� no�� �ͼ� list�� ��� DB�� ������.
		
		List<Integer>list=new ArrayList<Integer>();
		
		for(int i:no){
			
			list.add(i);		
		}
		 return this.getSqlSession().selectList("orderListToBasket", list);
	}
	
	public List<BmSupportBean> supportSelect(){//�Ŀ� ���̺��� �Ŀ����� ã�ƿ���
		
		return this.getSqlSession().selectList("supportSelect");
	}
	
	public void couponInsert(BmCouponBean bean){//Ư�� ����Կ��� ���� �߰��ϱ�
		System.out.println(bean);
		this.getSqlSession().insert("couponInsert",bean);
	}
	
	public HashMap<String, Object> couponSelect(int currentpage){//������������ �� �信�� ���� ���������� ��ȣ�� �������� �ȴ�.
		
		int pageshowcount=3;
		int totalpagecount=this.getSqlSession().selectOne("couponTotalSelect");//�� ���� ����
		int totalpage=(totalpagecount%pageshowcount)==0?(totalpagecount/pageshowcount):(totalpagecount/pageshowcount)+1;//�� ������
		int start=((currentpage-1)*pageshowcount)+1;//�� �������� �� ù��° ��ǰ
		int end=pageshowcount*currentpage;//�� �������� �� ������ ��ǰ
		
		HashMap<String, Object> map=new HashMap<String, Object>();//������ ó�� ��ǰ�� ������ ��ǰ�� ã�ƿ��� ���� ��
		map.put("start", start);
		map.put("end", end);
		
		HashMap<String, Object> map2=new HashMap<String, Object>();//ã�ƿ� ��������Ʈ�� �� �������� ������� ��
		map2.put("list", this.getSqlSession().selectList("couponSelect", map));
		map2.put("totalpage", totalpage);
		
		return map2;
	}
	
	public void productOrderInsert(BmBasketBean bean){//�ֹ� ���̺�� �ִ°�
		System.out.println(bean);
		this.getSqlSession().insert("productOrderInsert", bean);
      
	}
	
	public List<BmMyPageBean> myPageSelect(HashMap<String, Object>map){//�ֹ����̺� ���� �ֹ��� ��ǰ��  ã�ƿ���
		
		return this.getSqlSession().selectList("myPageSelect",map);
	}
	
	public void supportPriceInsert(int supportprice,int ownerno,String condition){//����� ��ȣ�� �Ŀ��������� �μ�Ʈ ����
		int sumSupportPrice=0;
		System.out.println(supportprice+","+ownerno+","+condition);
		if(condition.equals("sum")){
		 sumSupportPrice= supportRriceSelect(ownerno)+supportprice;//������ �ִ� �Ŀ������ݰ� �߰��� �Ŀ��������� �����ش�.
		}else if(condition.equals("minus")){
		 sumSupportPrice= supportRriceSelect(ownerno)-supportprice;//������ �ִ� �Ŀ������ݰ� �߰��� �Ŀ��������� �����ش�.
		}
		System.out.println("supportPriceInsert,"+sumSupportPrice);
		System.out.println("supportPriceInsert,"+ownerno);
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("supportprice", sumSupportPrice);
		map.put("ownerno", ownerno);
		
		 this.getSqlSession().update("supportPriceInsert", map);
	}
	
	public int supportRriceSelect(int ownerno){//����� ��ȣ�� �� �Ŀ��������� �̾ƿ�
		System.out.println("supportRriceSelect,"+ownerno);
		System.out.println("supportRriceSelect,"+this.getSqlSession().selectOne("supportRriceSelect", ownerno));
		return this.getSqlSession().selectOne("supportRriceSelect", ownerno);
	}
	
	public int orderDiscountSelect(int ownerno){//����� �ֹ� ��Ͽ��� �ֹ��� ��ǰ�� �� ���� ������
		
		System.out.println("---------------"+this.getSqlSession().selectOne("orderDiscountSelect", ownerno));
		Object cg=this.getSqlSession().selectOne("orderDiscountSelect", ownerno);
		
		if(cg==null){
			return 0;
		}else{
			return this.getSqlSession().selectOne("orderDiscountSelect", ownerno);
		}
		
	}
	
	public int selectSupportPrice(String name,int supportPrice){//�Ŀ����̺� ���� �̸��� �̿��� �������� ã�� ������ �� �ٽ� �־��ش�.
		System.out.println(name);
		System.out.println(this.getSqlSession().selectOne("selectSupportPrice", name.trim()));
		int sumSupportPrice=(Integer)(this.getSqlSession().selectOne("selectSupportPrice", name.trim()))+supportPrice;//db�Ŀ��ݰ� �߰��Ǵ� �Ŀ��� ������
		System.out.println(sumSupportPrice);
		
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("supportprice", sumSupportPrice);
		map.put("name", name);
		
		this.getSqlSession().update("selectSupportPriceUpdate", map);//������ �Ŀ����� �ٽ� db�� �־���.������Ʈ
		return this.getSqlSession().selectOne("selectSupportPrice", name);//�׸��� �ٽ� ������ �Ŀ����� ������.
	}
	
	
}
