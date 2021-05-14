package sist.com.bm;

import java.io.FileOutputStream;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sist.com.bm.StoreDao;
import sist.com.bm.StoreLatterBean;
import sist.com.bm.BmMyPageBean;

@Controller
public class StoreController {
	
	@Resource(name="storeDao")
	private StoreDao dao;

	@RequestMapping(value="latterWrite.do")
	public String latterWriteProcess(int no,Model model){
		System.out.println("sdfsdf");
		System.out.println(no);
		model.addAttribute("order", dao.latterWriteDao(no));
		   String b = new String();
		   Object data=dao.latterPriceDao(dao.latterWriteDao(no).getProductcode());

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
      model.addAttribute("price", b);
      System.out.println("kjsdflkjsd");
	  return "store/latterWrite";
	}
	
	@RequestMapping(value="latterFormSend.do")
	public String latterFormSend(StoreLatterBean bean,@RequestParam(value="file",required=false)MultipartFile file){
		System.out.println(bean);
		System.out.println(file.getOriginalFilename());
		String locations="D:\\springDev\\SpringBegin\\SpringMyBatis\\SpringSi\\src\\main\\webapp\\upload\\";
		FileOutputStream fos;
		String fileDemo=file.getOriginalFilename();
		if(fileDemo.length()>0){
			try {
				fos=new FileOutputStream(locations+fileDemo);
				fos.write(file.getBytes());
				fos.close();
				bean.setImg(file.getOriginalFilename());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		dao.latterWriteInputDao(bean);
		
		return "redirect:joProject/latterWrite.jsp";
	}
	
}
