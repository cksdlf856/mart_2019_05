package sist.com.bm;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import sist.com.bm.StoreDao;
import sist.com.bm.StoreLatterBean;
import sist.com.bm.StoreOrderBean;
import sist.com.bm.StoreProductBean;
import sist.com.bm.StoreSearchOrderBean;

@Component
public class StorePagingProcess {

	@Resource(name="storeDao")
	private StoreDao dao;
	
	@Autowired
	private BmDao dao1;
	
	private StringBuffer sb=new StringBuffer();
	
	public HashMap<String, Object> pagingAction(HashMap<String,Object>map){
		
			List<StoreLatterBean> list = null;
		    int pageScale=Integer.parseInt((String)map.get("pageEA"));
		    int totalRow=dao.getTotalRowLatter();
		    int totalPage=(totalRow%pageScale)==0?(totalRow/pageScale):(totalRow/pageScale)+1;
		    if(totalRow==0)totalPage=1;	    
		    int currentPage=1;
		    String temp="1";
		    temp=((String)map.get("page")).equals("0")?"1":(String)map.get("page");
		    currentPage=Integer.parseInt(temp);		    
		    int start=1+(currentPage-1)*pageScale;
		    int end=pageScale+(currentPage-1)*pageScale;
		    int currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
		    int startPage=1+(currentBlock-1)*pageScale;
		    int endPage=pageScale+(currentBlock-1)*pageScale;
		    if(totalPage<=endPage)endPage=totalPage;		   
		    map.put("start", start);
		    map.put("end", end);	    
			list = dao.latterListProcess(map);
			map.put("list", list);
			sb.delete(0, sb.length());
			sb.append("<a class=\"pageP\" lang=1 href=\"#\" ><img src=\"/web/img/button/btn_first.gif\" alt=\"처음페이지\" /></a>");
			if(currentBlock>1){
			sb.append("<a class=\"pageP\" lang="+(startPage-1)+" href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");
			}else{
				sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");	
			}
			sb.append("<span>");
			for(int i=startPage;i<=endPage;i++){
				if(i==currentPage){
					sb.append("<font size=; color='' style='font-weight:bolder;'>"+i+"</font>");	
				}else{
					sb.append("<a class=\"pageP\" lang="+i+" href='#' style='text-decoration:none; color:black;'>["+i+"]</a>");
				}
			}
			sb.append("</span>");
			if(totalPage>endPage){
			sb.append("<a class=\"pageP\" lang="+(endPage+1)+" href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");
			}else{
			sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");	
			}
			sb.append("<a class=\"pageP\" lang="+totalPage+" href=\"#\"><img src=\"/web/img/button/btn_last.gif\" alt=\"마지막페이지\" /></a>");
			//model.addAttribute("page", sb.toString());
			System.out.println("totalpage"+totalPage);
			System.out.println("endpage"+endPage);
			if(list.size()!=0){
			map.put("page", sb.toString());
			}
			return map;
	}
	public HashMap<String, Object> productSearchPaging(StoreSearchOrderBean bean){
		
		    HashMap<String, Object>map = new HashMap<String, Object>();
			List<StoreProductBean> list = null;
		    int pageScale=bean.getOrderNum();
		    int totalRow=dao.productTotalCount();
		    int totalPage=(totalRow%pageScale)==0?(totalRow/pageScale):(totalRow/pageScale)+1;
		    if(totalRow==0)totalPage=1;	    
		    int currentPage=1;
		    String temp="1";
		    temp=(""+bean.getPage()).equals("0")?"1":""+bean.getPage();
		    currentPage=Integer.parseInt(temp);		    
		    int start=1+(currentPage-1)*pageScale;
		    int end=pageScale+(currentPage-1)*pageScale;
		    int currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
		    int startPage=1+(currentBlock-1)*pageScale;
		    int endPage=pageScale+(currentBlock-1)*pageScale;
		    if(totalPage<=endPage)endPage=totalPage;		   
		    bean.setStart(start);
		    bean.setEnd(end);    
			list = dao.productSearchDao(bean);
			
			for(int i=0;i<list.size();i++){
				System.out.println(list.get(i));
			}
			
			map.put("list", list);
			sb.delete(0, sb.length());
			sb.append("<a class=\"pageP\" lang=1 href=\"#\" ><img src=\"/web/img/button/btn_first.gif\" alt=\"처음페이지\" /></a>");
			if(currentBlock>1){
			sb.append("<a class=\"pageP\" lang="+(startPage-1)+" href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");
			}else{
				sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");	
			}
			sb.append("<span>");
			for(int i=startPage;i<=endPage;i++){
				if(i==currentPage){
					sb.append("<font size=; color='' style='font-weight:bolder;'>"+i+"</font>");	
				}else{
					sb.append("<a class=\"pageP\" lang="+i+" href='#' style='text-decoration:none; color:black;'>["+i+"]</a>");
				}
			}
			sb.append("</span>");
			if(totalPage>endPage){
			sb.append("<a class=\"pageP\" lang="+(endPage+1)+" href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");
			}else{
			sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");	
			}
			sb.append("<a class=\"pageP\" lang="+totalPage+" href=\"#\"><img src=\"/web/img/button/btn_last.gif\" alt=\"마지막페이지\" /></a>");
			System.out.println("totalpage"+totalPage);
			System.out.println("endpage"+endPage);
			if(list.size()!=0){
			map.put("page", sb.toString());
			}
			return map;
	}
	
	public HashMap<String, Object>MypagePaging(HashMap<String, Object>map){
	    //HashMap<String, Object>map = new HashMap<String, Object>();
		List<BmMyPageBean> list = null;
	    int pageScale=3;
	    int totalRow=dao.myOrderAllCountDao((Integer)map.get("owner"));
	    int totalPage=(totalRow%pageScale)==0?(totalRow/pageScale):(totalRow/pageScale)+1;
	    if(totalRow==0)totalPage=1;	    
	    int currentPage=1;
	    String temp="1";
	    temp=(""+map.get("page")).equals("0")?"1":""+map.get("page");
	    currentPage=Integer.parseInt(temp);	
	    int start=1+(currentPage-1)*pageScale;
	    int end=pageScale+(currentPage-1)*pageScale;
	    int currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
	    System.out.println("currentblock"+currentBlock);
	    //int startPage=1+(currentBlock-1)*pageScale;
	    //int endPage=pageScale+(currentBlock+1)*pageScale;
	    int startPage=1;
	    int endPage=7;
	    if(totalPage<=endPage)endPage=totalPage;
	    map.put("start", start);
	    map.put("end", end);  
		list = dao1.myPageSelect(map);
		
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i));
//		}
		
		map.put("list", list);
		sb.delete(0, sb.length());
		sb.append("<a class=\"pageP\" lang=1 href=\"#\" ><img src=\"/web/img/button/btn_first.gif\" alt=\"처음페이지\" /></a>");
		if(currentBlock>1){
		sb.append("<a class=\"pageP\" lang="+(startPage-1)+" href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");
		}else{
			sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_prev.gif\" alt=\"이전\" /></a>");	
		}
		sb.append("<span>");
		for(int i=startPage;i<=endPage;i++){
			if(i==currentPage){
				sb.append("<font size=; color='' style='font-weight:bolder;'>"+i+"</font>");	
			}else{
				sb.append("<a class=\"pageP\" lang="+i+" href='#' style='text-decoration:none; color:black;'>["+i+"]</a>");
			}
		}
		sb.append("</span>");
		if(totalPage>endPage){
		sb.append("<a class=\"pageP\" lang="+(endPage+1)+" href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");
		}else{
		sb.append("<a href=\"#\"><img src=\"/web/img/button/btn_next.gif\" alt=\"다음\" /></a>");	
		}
		sb.append("<a class=\"pageP\" lang="+totalPage+" href=\"#\"><img src=\"/web/img/button/btn_last.gif\" alt=\"마지막페이지\" /></a>");
		System.out.println("totalpage"+totalPage);
		System.out.println("endpage"+endPage);
		if(list.size()!=0){
		map.put("page", sb.toString());
		}
		return map;
}
}
