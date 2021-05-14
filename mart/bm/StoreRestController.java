package sist.com.bm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import sist.com.app3.di.Store;
import sist.com.bm.StoreDao;
import sist.com.bm.StoreLatterBean;
import sist.com.bm.StoreOrderBean;
import sist.com.bm.StoreSearchOrderBean;

@RestController
public class StoreRestController{
	
	@Resource(name="storeDao")
	private StoreDao dao;
	@Inject
	private StorePagingProcess paging;
	
	
//	@RequestMapping(value="myPageList.do")
//	public HashMap<String, Object> myPageListSelect(@RequestParam(value="ownerno",required=false,defaultValue="1")String owner,
//			                     @RequestParam(value="page",required=false,defaultValue="5")String page){
//		HashMap<String, Object>map=new HashMap<String, Object>();
//		System.out.println(owner);
//		System.out.println(page);
//		map.put("owner", owner);
//		map.put("page", page);
//		//paging.MypagePaging(map);
//		List aa=new ArrayList();
//		List<StoreLatterBean> bb=new ArrayList<StoreLatterBean>();
//		map=paging.MypagePaging(map);
//		aa=(List)map.get("list1");
//		if(aa.size()==0){
//			map.put("list", aa);
//			return map;
//		}
//		System.out.println(aa);
//		bb=dao.latterChkProcess();
//		if(bb.size()!=0){
//			int size=aa.size();
//			for(int i=0;i<size;i++){
//				StoreOrderBean bean=(StoreOrderBean)aa.get(i);
//				for(int j=0;j<bb.size();j++){
//					if(bb.get(j).getOrderno()==bean.getOrderno()){
//						bean.setLatterChk(1);
//						aa.remove(i);
//						aa.add(i, bean);
//					}
//				}
//			}
//		}
//
//		for(int i=0;i<aa.size();i++){
//			int price=0;
//			StoreOrderBean bean=(StoreOrderBean)aa.get(i);
//			price=dao.latterPriceDao(bean.getStoreproductcode());
//			price=price*bean.getOrdercount();
//			bean.setOrderPrice(commaProcess(price));
//			aa.remove(i);
//			aa.add(i, bean);
//		}
////		for(int i=0;i<aa.size();i++){
////			System.out.println(aa.get(i));
////		}
//	
//           StoreOrderBean ob=(StoreOrderBean)aa.get(0);
//           String[] gradeValue={"어벤져스","대박사장","일반사장","초보사장"};
//		   String grade="";
//           int score1=1000;
//		   int score=ob.getMileage();
//           for(int i=0; i<4 ;i++){
//        	   if(score>=score1){
//        		   grade=gradeValue[i];
//        		   break;
//        	   }
//        	   score1=score1-200;
//        	   grade=gradeValue[i];
//           }
//
//		aa.add(commaProcess(dao.orderExtendedPrice(owner)));
//		aa.add(dao.orderCartEa(owner));
//		aa.add(grade);
//		map.put("list1", aa);
//
//		
//		return map;
//		
//	}	
//	
//	   @RequestMapping(value="basket.do")
//	   public String selectBasket(){
//	      System.out.println("basket");
//	      return "test";
//	   }
//	   
//	   @RequestMapping(value="selectLatterList.do")
//	   public HashMap<String, Object> latterListProcess(@RequestParam(value="skey",required=false,defaultValue="0")String searchPart,
//			   @RequestParam(value="title",required=false,defaultValue="")String searchTitle,@RequestParam(value="skey1",required=false,defaultValue="0")String pagingEA,
//			   @RequestParam(value="skey2",required=false,defaultValue="0")String order,@RequestParam(value="page",required=false,defaultValue="0")String page){
//
//		   HashMap<String, Object>map = new HashMap<String, Object>();
//		   map.put("skey", searchPart);
//		   map.put("title", searchTitle);
//		   map.put("pageEA", pagingEA);
//		   map.put("order", order);
//		   map.put("page", page);
//		   
//		   paging.pagingAction(map);
//		   
//		   return map;
//		   
//	   }
	   
	   @RequestMapping(value="productSearch.do")
	   public HashMap<String, Object>productSearchProcess(StoreSearchOrderBean bean){
		   System.out.println("-------------------------------------------------------------");
		   System.out.println(bean);
		   if(bean.getCategory()==null){
			   bean.setCategory("all");
			   bean.setMade("");
			   bean.setFirstDay("");
			   bean.setSecondDay("");
		   }
		   System.out.println(bean);
		   HashMap<String, Object>map = new HashMap<String, Object>();
		   map=paging.productSearchPaging(bean);
		   
		   return map;
	   }
	   
	   
	   public String commaProcess(Object obj){
		   String b = new String();
		   Object data=obj;
           if (data != null) {
               StringBuffer a = new StringBuffer();
               a.append(data);
               if (a.length() > 3) {
                  for (int k = a.length()-1; k >= 0; k--) {
                     if (k % 3 == 0) {
                        a.insert(a.length()-k, ",");
                     }
                  }
               }
               a.deleteCharAt(a.length()-1);
               b=a.toString();
            }
		   return b;
	   }
	
}





