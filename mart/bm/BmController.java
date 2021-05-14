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
	public List<BmBasketBean> basketSelect(){//��ٱ��� ��� ã�ƿ���	
		return dao.basketSelect();
	}
	
	@RequestMapping(value="bmbasketdelete.do")
	public void basketDelete(int no){//��ٱ��� ���� ����
		
		dao.basketDelete(no);
	}
	
	@RequestMapping(value="bmbasketmodi.do")
	public void basketModi(int no,int quantity){//��ٱ��� ���� ���� ����
		
		dao.basketModi(no, quantity);
	}
	
	@RequestMapping(value="orderlistToBasket.do")
	public List<BmBasketBean> orderListToBasket(String basketList){//��ٱ��Ͽ��� ������ ��ǰ�� �ֹ� �������� �̵�
		
		int []no=new int[basketList.split("-").length];
		for(int i=0; i<basketList.split("-").length; i++){
			  no[i]=Integer.parseInt(basketList.split("-")[i]);
			}
	
		return dao.orderListToBasket(no);
	}
	
	@RequestMapping(value="bmsupport.do")
	@ResponseBody
	public List<BmSupportBean> supportSelect(){//�Ŀ� ���̺� ã�ƿ���
		
		return dao.supportSelect();
	}
	
	@RequestMapping(value="couponSelect.do")
	@ResponseBody
	public HashMap<String, Object> couponSelect(String currentpage){//���� ���̺� ã�ƿ���
		
		return dao.couponSelect(currentpage==null?(1):(Integer.parseInt(currentpage)));//��ǰ ����Ʈ�� �� ������ ���� ��� �ִ� HashMap�� ������.
	}
	
	@RequestMapping(value="myPageList.do")//-----------------------------�����۾���
	@ResponseBody
	public HashMap<String, Object> myPageList(@RequestParam(value="ownerno",required=false,defaultValue="1")String ownerno1,
			                                  @RequestParam(value="page",required=false,defaultValue="1")int page){//���������� ����Ʈ ��������
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
	class innerClass{//controller �̿��ϴ� �̳�Ŭ����
		

		
		
		@RequestMapping(value="bmbasketInfo.do")
		public String basketInfo(BmBasketBean bean){//��ٱ��� ����Ʈ ��������
			dao.basketInsert(bean);
			return "redirect:store/ShoppingBasket.jsp";
		}
		
		
		@RequestMapping(value="orderMove.do")
		public String orderMove(@ModelAttribute(name="bmbean")BmBasketBean bean,String page,int supportPrice,RedirectAttributes redirectAttributes){
			//���⿡�� ���� ���Ѿ� ���� ������ �ݴ������� bean�� ������ ���� �� �Ѵ�.
			//�� ���Ŀ� ���� @ModelAttribute(name="bmbean")�� �־��ش�
			instanceSupportPrice=supportPrice;
			redirectAttributes.addAttribute("supportPrice", supportPrice);//�Ŀ� ������
			redirectAttributes.addAttribute("page", page);//redirect�� �Ķ���� ���� ������ RedirectAttributes�� ����ϰ� redirect .do�� �̵��ϰ� dispatcher�� ������ �̵���.
			return "redirect:move.do";									
		}
		
		@RequestMapping(value="move.do")
		public String orderMove2(Model model,@RequestParam(value="page")String page,@RequestParam(value="supportPrice")int supportPrice){//page��ȣ�� �������� ���� ���
			model.addAttribute("supportPrice", supportPrice);
			model.addAttribute("page", page);
			
			return "store/order";
		}
		
		@ModelAttribute(name="bmbean")
		public BmBasketBean setBmBean(){//�̰� ����� ���� ������ ���� ȣ��� session���� bmbean�� ã�µ� ��� ������ ����. �׷��� ���⼭ new�� ���ش�.���� ���� ����
			return new BmBasketBean();
		}
		
		@RequestMapping(value="pageback.do")
		public String pageBack(@ModelAttribute(name="bmbean")BmBasketBean bean,SessionStatus session){//�ֹ��������� ���ư�
										//������������ �Ѿ�� ���� �ִ� session�� session.setComplete();�� �ʱ�ȭ �����ش�.
			
			session.setComplete();//���� �ʱ�ȭ (�����ָ� �������̷� ���ƿͼ� ������ �ٲ㵵 ���ǰ��� �����Ǿ� ���� ���� �Ұ���
			return "redirect:store/storeOrder.jsp";
		}
		@RequestMapping(value="basketPageBack.do")
		public String basketPageBack(@ModelAttribute(name="bmbean")BmBasketBean bean,SessionStatus session){//��ٱ��� �������� ���ư�
			
			session.setComplete();
			return "redirect:store/ShoppingBasket.jsp";
		}
		
		@RequestMapping(value="orderPageMove.do")
		public String orderPageMove(String tempId,String page,RedirectAttributes redirectAttributes){//��ٱ��������� ���� �ֹ��������� �̵�
			
			redirectAttributes.addAttribute("tempId", tempId);
			redirectAttributes.addAttribute("page", page);
			
			return "redirect:move2.do";
		}
		@RequestMapping(value="move2.do")
		public String orderPageMove2(Model model,@RequestParam(value="page")String page,@RequestParam(value="tempId")String tempId){//page��ȣ,��ٱ��� ��� no���� �������� ���� ���
			model.addAttribute("tempId", tempId);
			model.addAttribute("page", page);
			
			return "store/order";
		}
		
		@RequestMapping(value="couponinsert.do")
		public String couponInsert(int ownerno){//Ư�� ����Կ��� ���� �߰��ϱ�
				
			int couponDiscount=(int)(Math.random()*3);
			double couponDiscount2=couponDiscount==0?0.03:couponDiscount*0.01;//0�϶��� 0.03���� ���� �ϱ� ����	
			String cname=((int)(couponDiscount2*100))+"% ���ϴ� ��ȯ��";
			
			BmCouponBean bean=new BmCouponBean();
			bean.setOwnerno(ownerno);
			bean.setDiscount(couponDiscount2);
			bean.setCname(cname);
			
			dao.couponInsert(bean);
			
			return "store/store";
		}
		
		@RequestMapping(value="productInsert.do")
		public String productOrderInsert(String orderProductNo,int ownerno,BmBasketBean bean,RedirectAttributes redirectAttributes){
			//��ٱ��Ͽ��� ������ ��ǰ�� no�� �̿��ؼ� ã�ƿͼ� �ֹ� ������� �μ�Ʈ �ϴºκ�
			
			if(orderProductNo!=null){//��ٱ��� ���������� ������ ��ǰ�� no���� �̿��ؼ� 
				
			int[]no=new int[orderProductNo.split("-").length];
			for(int i=0;i<orderProductNo.split("-").length;i++){
				no[i]=Integer.parseInt(orderProductNo.split("-")[i]);
			}		
			
			/*dao.orderListToBasket(no);*/
		
			List<BmBasketBean> productList=new ArrayList<BmBasketBean>();
			productList=dao.orderListToBasket(no);//��ٱ��� ���̺��� ������ ��ǰ���� ã�ƿ�
			
			   for(int i=0;i<productList.size();i++){
				   productList.get(i).setProductprice(productList.get(i).getProductprice()*productList.get(i).getProductquantity());
				   dao.productOrderInsert((BmBasketBean)productList.get(i));//��ٱ��Ͽ��� ã�ƿ� ��ǰ���� �����ؼ� �ֹ����̺�� �־���
			   }
			   
			   redirectAttributes.addAttribute("ownerno", ownerno); 
			   
			}else{
				System.out.println(bean);
				dao.productOrderInsert(bean);//��ǰ ������������ ��ǰ �ϳ��� �ֹ����̺�� �־���
				System.out.println(instanceSupportPrice+","+bean.getOwnerno());
				dao.supportPriceInsert(instanceSupportPrice,bean.getOwnerno(),"sum");
				
				redirectAttributes.addAttribute("ownerno", bean.getOwnerno());
			}
					
			return "redirect:move3.do";
		}
		
		@RequestMapping(value="move3.do")
		public String myPageMove(Model model,@RequestParam(value="ownerno")int ownerno){//��ٱ��� ������ ���� ������������ �Ѿ			
			model.addAttribute("ownerno", ownerno);	
			
			return "store/mypage";
		}
		
		@RequestMapping(value="laboratoryMove.do")
		public String laboratoryMove(String change,int ownerno,RedirectAttributes redirectAttributes){//�Ŀ��Ҷ� ���������� ������ �̵�
			System.out.println(change);
			redirectAttributes.addAttribute("change", change);
			redirectAttributes.addAttribute("ownerno", ownerno);
			return "redirect:move4.do";
		}
		
		@RequestMapping(value="move4.do")
		public String laboratoryMovePage(Model model,@RequestParam(value="change")String change,@RequestParam(value="ownerno")int ownerno){//�Ŀ��Ҷ� ���������� ������ �̵�
			System.out.println(change);
			model.addAttribute("change", change);
			model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));
			return "store/laboratory";
		}
		
	    @RequestMapping(value="orderDiscount.do")
	    public String orderDiscountSelect(Model model,int ownerno,int term){//����� ������ �̾��ִ°�
	    	System.out.println("gggg");
	    	int discount=dao.orderDiscountSelect(ownerno);//����� �ֹ� ���̺��� ����*���� �ؼ� �� ���� ������
	    	double discountrate=0;
	    	if(discount<500000){
	    		discountrate=0.02;
			  //�����,��ڻ���,�Ϲݻ���,�ʺ�����
			}else if(discount>=500000&&discount<1000000){
				discountrate=0.03;
				
			}else if(discount>=1000000&&discount<1500000){
				discountrate=0.04;
				
			}else if(discount>=1500000){
				discountrate=0.05;
				 
			}
	    	System.out.println(discountrate);
	    	model.addAttribute("discountrate", discountrate);//����� ������ ������
	    	model.addAttribute("term", term);//������� ȭ���� �������� �ѹ��� �ߵ��Ǳ� ���� ����
	        
	    	return "store/storeOrder";
	    }
	    
	    //@RequestMapping(value="selectBmownerSupport.do")
		//public String selectBmownerSupport(int ownerno,Model model,String change){//������ ������ ���� ����� �Ŀ� ������ �����°�
		//	model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));
		//	model.addAttribute("change",change);
		//   return "store/laboratory";
		//}
	    
	    @RequestMapping(value="bmSupportGo.do")
	    public String supportPriceSum(String name,int supportPrice,int ownerno,Model model){//�Ŀ����̺��� �Ŀ��� �����ͼ� �����ְ� �ٽ� �־��ش�.
	    	System.out.println("controller,"+name+","+ownerno);
	    	model.addAttribute("updateSumSupportPrice", dao.selectSupportPrice(name,supportPrice));//dao�� �̸��� ������Ʈ�� �Ŀ��������� �����ְ� ������ �Ŀ� �������� �־��ش�.
	    	dao.supportPriceInsert(supportPrice,ownerno,"minus");//��񿡼� ���� ����� �������� ����� ��ŭ ���ش�.
	    	model.addAttribute("supportprice", dao.supportRriceSelect(ownerno));//����� �Ŀ������� ���´�.
	    	return "store/laboratory";
	    }
	    
	    //@RequestMapping(value="bmOwnerSupportGo.do")
	   // public String ownerSupportPriceMinus(int ownerno,int supportPrice){//����� �Ŀ������� �� ����ϸ� �������ش�.
	    //	//int minusOwnerSupportPrice=dao.supportRriceSelect(ownerno)-supportPrice;//��񿡼� ���� ����� �������� ����� ��ŭ ���ش�.
	    //	System.out.println("controller"+ownerno+","+supportPrice);
	    //	dao.supportPriceInsert(supportPrice,ownerno,"minus");
	    //	
	   //	return "store/laboratory";
	   // }
   
	}
	
}
