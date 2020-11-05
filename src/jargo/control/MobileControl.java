package jargo.control;





import jargo.biz.Biz;
import jargo.vo.MenuVO;

import javax.servlet.http.HttpServletRequest;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;





@Controller
public class MobileControl {
	@Autowired
	@Qualifier("MenuBiz")
	Biz biz;
	
	@RequestMapping(value="/mobilemain.jargo")
	public ModelAndView mView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mobile/mobilemain");
		return mv; 
	}
	@RequestMapping(value="/mobiledetail.jargo" , method=RequestMethod.GET)
	public ModelAndView menus(@RequestParam( value="menuno") int menu_number,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		MenuVO vo = new MenuVO(menu_number);
		MenuVO get = (MenuVO) biz.get(vo);
		mv.addObject("menu", get);
		mv.setViewName("mobile/mobilemenudetail");
	    return mv;
	}
	
	
}
