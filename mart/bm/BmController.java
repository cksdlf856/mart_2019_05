package sist.com.bm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sist.com.bm.BmDao;

@RestController
public class BmController {
	
	private int instanceSupportPrice;
	
	@Resource(name="bmDao")
	private BmDao dao;

	@Inject
	private StorePagingProcess paging;
	
	
	@RequestMapping(value="bmbasket.do",produces="application/json")
	@ResponseBody
	public List<BmBasketBean> basketSelect(){//장바구니 목록 찾아오기	
		return dao.basketSelect();
	}
	
	@RequestMapping(value="bmbasketdelete.do")
	public void basketDelete(int no){//장바구니 선택 삭제
		
		dao.basketDelete(no);
	}
	
	@RequestMapping(value="bmbasketmodi.do")
	public void basketModi(int no,int quantity){//장바구니 선택 수량 수정
		
		dao.basketModi(no, quantity);
	}
	
	@RequestMapping(value="orderlistToBasket.do")
	public List<BmBasketBean> orderListToBasket(String basketList){//장바구니에서 선택한 상품이 주문 페이지로 이동
		
		int []no=new int[basketList.split("-").length];
		for(int i=0; i<basketList.split("-").length; i++){
			  no[i]=Integer.parseInt(basketList.split("-")[i]);
			}
	
		return dao.orderListToBasket(no);
	}
	
	@RequestMapping(value="bmsupport.do")
	@ResponseBody
	public List<BmSupportBean> supportSelect(){//후원 테이블 찾아오기
		
		return dao.supportSelect();
	}
	
	@RequestMapping(value="couponSelect.do")
	@ResponseBody
	public HashMap<String, Object> couponSelect(String currentpage){//쿠폰 테이블 찾아오기
		
		return dao.couponSelect(currentpage==null?(1):(Integer.parseInt(currentpage)));//상품 리스트와 총 페이지 수를 담고 있는 HashMap을 가져옴.
	}
	
	@RequestMapping(value="myPageList.do")//-----------------------------경재작업장
	@ResponseBody
	public HashMap<String, Object> myPageList(@RequestParam(value="ownerno",required=false,defaultValue="1")String ownerno1,
			                                  @RequestParam(value="page",required=false,defaultValue="1")int page){//마이페이지 리스트 가져오기
		int ownerno=1;
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("owner", ownerno);
		map.put("page", page);
		//map.put("list", dao.myPageSelect());
		paging.MypagePaging(map);
		map.put("supportprice", dao.supportRriceSelect(ownerno));
		return map;
	}  
	  
	@SessionAttributes(value={"bmbean"})
	@Controller
	class innerClass{//controller 이용하는 이너클래스
		

		
		
		@RequestMapping(value="bmbasketInfo.do")
		public String basketInfo(BmBasketBean bean){//장바구니 리스트 가져오기
			dao.basketInsert(bean);
			return "redirect:store/ShoppingBasket.jsp";
		}
		
		
		@RequestMapping(value="orderMove.do")
		public String orderMove(@ModelAttribute(name="bmbean")BmBasketBean bean,String page,int supportPrice,RedirectAttributes redirectAttributes){
			//여기에서 모델을 만둘어 주지 않으면 반대편으로 bean을 가지고 가지 못 한다.
			//그 이후에 값을 @ModelAttribute(name="bmbean")로 넣어준다
			instanceSupportPrice=supportPrice;
			redirectAttributes.addAttribute("supportPrice", supportPrice);//후원 적립금
			redirectAttributes.addAttribute("page", page);//redirect로 파라미터 값을 보낼때 RedirectAttributes를 사용하고 redirect .do로 이동하고 dispatcher로 페이지 이동함.
			return "redirect:move.do";									
		}
		
		@RequestMapping(value="move.do")
		public String orderMove2(Model model,@RequestParam(value="page")String page,@RequestParam(value="supportPrice")int supportPrice){//page번호를 가져오기 위해 사용
			model.addAttribute("supportPrice", supportPrice);
			model.addAttribute("page", page);
			
			return "store/order";
		}
		
		@ModelAttribute(name="bmbean")
		public BmBasketBean setBmBean(){//이걸 만들어 주지 않으면 최초 호출시 session에서 bmbean을 찾는데 없어서 오류가 난다. 그래서 여기서 new를 해준다.최초 오류 방지
			return new BmBasketBean();
		}
		
		@RequestMapping(value="pageback.do")
		public String pageBack(@ModelAttribute(name="bmbean")BmBasketBean bean,SessionStatus session){//주문페이지로 돌아감
										//이전페이지로 넘어갈때 남아 있는 session을 session.setComplete();로 초기화 시켜준다.
			
			session.setComplete();//세션 초기화 (안해주면 이전페이로 돌아와서 수량을 바꿔도 세션값이 유지되어 수량 변경 불가능
			return "redirect:store/storeOrder.jsp";
		}
		@RequestMapping(value="basketPageBack.do")
		public String basketPageBack(@ModelAttribute(name="bmbean")BmBasketBean bean,SessionStatus session){//장바구니 페이지로 돌아감
			
			session.setComplete();
			return "redirect:store/ShoppingBasket.jsp";
		}
		
		@RequestMapping(value="orderPageMove.do")
		public String orderPageMove(String tempId,String page,RedirectAttributes redirectAttributes){//장바구니페이지 에서 주문페이지로 이동
			
			redirectAttributes.addAttribute("tempId", tempId);
			redirectAttributes.addAttribute("page", page);
			
			return "redirect:move2.do";
		}
		@RequestMapping(value="move2.do")
		public String orderPageMove2(Model model,@RequestParam(value="page")String page,@RequestParam(value="tempId")String tempId){//page번호,장바구니 목록 no값을 가져오기 위해 사용
			model.addAttribute("tempId", tempId);
			model.addAttribute("page", page);
			
			return "store/order";
		}
		
		@RequestMapping(value="couponinsert.do")
		public String couponInsert(int ownerno){//특정 사장님에게 쿠폰 추가하기
				
			int couponDiscount=(int)(Math.random()*3);
			double couponDiscount2=couponDiscount==0?0.03:couponDiscount*0.01;//0일때는 0.03으로 들어가게 하기 위해	
			String cname=((int)(couponDiscount2*100))+"% 감하는 교환권";
			
			BmCouponBean bean=new BmCouponBean();
			bean.setOwnerno(ownerno);
			bean.setDiscount(couponDiscount2);
			bean.setCname(cname);
			
			dao.couponInsert(bean);
			
			return "store/store";
		}
		
		@RequestMapping(value="productInsert.do")
		public String productOrderInsert(String orderProductNo,int ownerno,BmBasketBean bean,RedirectAttributes redirectAttributes){
			//장바구니에서 선택한 물품들 no를 이용해서 찾아와서 주문 목록으로 인설트 하는부분
			
			if(orderProductNo!=null){//장바구니 페이지에서 선택한 상품들 no값을 이용해서 
				
			int[]no=new int[orderProductNo.split("-").length];
			for(int i=0;i<orderProductNo.split("-").length;i++){
				no[i]=Integer.parseInt(orderProductNo.split("-")[i]);
			}		
			
			/*dao.orderListToBasket(no);*/
		
			List<BmBasketBean> productList=new ArrayList<BmBasketBean>();
			productList=dao.orderListToBasket(no);//장바구니 테이블에서 선택한 상품들을 찾아옴
			
			   for(int i=0;i<productList.size();i++){
				   productList.get(i).setProductprice(productList.get(i).getProductprice()*productList.get(i).getProductquantity());
				   dao.productOrderInsert((BmBasketBean)productList.get(i));//장바구니에서 찾아온 상품들을 구입해서 주문테이블로 넣어줌
			   }
			   
			   redirectAttributes.addAttribute("ownerno", ownerno); 
			   
			}else{
				System.out.println(bean);
				dao.productOrderInsert(bean);//상품 상세페이지에서 상품 하나만 주문테이블로 넣어줌
				System.out.println(instanceSupportPrice+","+bean.getOwnerno());
				dao.supportPriceInsert(instanceSupportPrice,bean.getOwnerno(),"sum");
				
				redirectAttributes.addAttribute("ownerno", bean.getOwnerno());
			}
					
			return "redirect:move3.do";
		}
		
		@RequestMapping(value="move3.do")
		public String myPageMove(Model model,@RequestParam(value="ownerno")int ownerno){//장바구니 페이지 에서 마이페이지로 넘어감			
			model.addAttribute("ownerno", ownerno);	
			
			return "store/mypage";
		}
		
		@RequestMapping(value="laboratoryMove.do")
		public String laboratoryMove(String change,int ownerno,RedirectAttributes redirectAttributes){//후원할때 상세페이지로 페이지 이동
			System.out.println(change);
			redirectAttributes.addAttribute("change", change);
			redirectAttributes.addAttribute("ownerno", ownerno);
			return "redirect:move4.do";
		}
		
		@RequestMapping(value="move4.do")
		public String laboratoryMovePage(Model model,@RequestParam(value="change")String change,@RequestParam(value="ownerno")int ownerno){//후원할때 상세페이지로 페이지 이동
			System.out.println(change);
			model.addAttribute("change", change);
			model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));
			return "store/laboratory";
		}
		
	    @RequestMapping(value="orderDiscount.do")
	    public String orderDiscountSelect(Model model,int ownerno,int term){//사장님 할인율 뽑아주는곳
	    	System.out.println("gggg");
	    	int discount=dao.orderDiscountSelect(ownerno);//사장님 주문 테이블에서 수량*가격 해서 총 합을 가져옴
	    	double discountrate=0;
	    	if(discount<500000){
	    		discountrate=0.02;
			  //어벤저스,대박사장,일반사장,초보사장
			}else if(discount>=500000&&discount<1000000){
				discountrate=0.03;
				
			}else if(discount>=1000000&&discount<1500000){
				discountrate=0.04;
				
			}else if(discount>=1500000){
				discountrate=0.05;
				 
			}
	    	System.out.println(discountrate);
	    	model.addAttribute("discountrate", discountrate);//사장님 할인율 가져감
	    	model.addAttribute("term", term);//뷰딴에서 화면이 켜졌을때 한번만 발동되기 위한 조건
	        
	    	return "store/storeOrder";
	    }
	    
	    //@RequestMapping(value="selectBmownerSupport.do")
		//public String selectBmownerSupport(int ownerno,Model model,String change){//연구소 페이지 에서 사장님 후원 적립금 빼오는곳
		//	model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));
		//	model.addAttribute("change",change);
		//   return "store/laboratory";
		//}
	    
	    @RequestMapping(value="bmSupportGo.do")
	    public String supportPriceSum(String name,int supportPrice,int ownerno,Model model){//후원테이블에서 후원금 가져와서 더해주고 다시 넣어준다.
	    	System.out.println("controller,"+name+","+ownerno);
	    	model.addAttribute("updateSumSupportPrice", dao.selectSupportPrice(name,supportPrice));//dao로 이름과 업데이트될 후원적립금을 보내주고 합쳐진 후원 적립금을 넣어준다.
	    	dao.supportPriceInsert(supportPrice,ownerno,"minus");//디비에서 빼온 사장님 적립금을 사용한 만큼 빼준다.
	    	model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));//사장님 후원적립금 빼온다.
	    	return "store/laboratory";
	    }
	    
	    //@RequestMapping(value="bmOwnerSupportGo.do")
	   // public String ownerSupportPriceMinus(int ownerno,int supportPrice){//사장님 후원적립금 을 사용하면 차감해준다.
	    //	//int minusOwnerSupportPrice=dao.supportRriceSelect(ownerno)-supportPrice;//디비에서 빼온 사장님 적립금을 사용한 만큼 빼준다.
	    //	System.out.println("controller"+ownerno+","+supportPrice);
	    //	dao.supportPriceInsert(supportPrice,ownerno,"minus");
	    //	
	   //	return "store/laboratory";
	   // }
   
	}
	
}
