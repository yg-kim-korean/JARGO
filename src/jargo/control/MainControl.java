package jargo.control;



import jargo.biz.Biz;
import jargo.biz.OwnerBiz;
import jargo.vo.AdminVO;
import jargo.vo.CustomerVO;
import jargo.vo.OwnerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import view.View;



@Controller
public class MainControl {
	@Autowired
	@Qualifier("CustomerBIZ")
	Biz biz ;
	
	@Autowired
	@Qualifier("OwnerBiz")
	Biz ownerbiz ;
	

	@Autowired
	@Qualifier("AdminBIZ")
	Biz adminbiz ;
	

	@RequestMapping(value="/main.jargo")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		View view = new View();
		mv.addObject("view", view);
		return mv;		
	}
	

	@RequestMapping(value="/loginimpl.jargo",method=RequestMethod.POST)
	public ModelAndView loginimpl(CustomerVO customer,HttpServletRequest request){

		String mobile= request.getParameter("mobile");
		ModelAndView mv = new ModelAndView();
		View view = new View();
		
		CustomerVO result = (CustomerVO)biz.get(customer);
		HttpSession session = request.getSession();

		String log = "OK";
		String register = "OK";
		//String center="loginfail";

		if(result!=null && (result.getCustomer_pwd().equals(customer.getCustomer_pwd())) ){

			// customer

			session.setAttribute("loginuser", result);
			mv.addObject("customer",result);
			mv.setViewName("main");
		} 

		else{	//owner
			String owner_id = customer.getCustomer_id();
			String owner_pwd= customer.getCustomer_pwd();
			OwnerVO eee= new OwnerVO(owner_id, owner_pwd, null, null, null);
			OwnerVO result1 = (OwnerVO)ownerbiz.get(eee);
			
			if(  result1!=null && ((result1.getOwner_pwd()).equals(owner_pwd))  ){
	
				session.setAttribute("loginuser1", result1);
				view.setLeft("ownerleft");
				view.setFoot("login1");
				mv.setViewName("main");
			}
						
			else{	//admin				
				String admin_id = customer.getCustomer_id();
				String admin_pwd = customer.getCustomer_pwd();
				AdminVO fff = new AdminVO(admin_id, admin_pwd);
				AdminVO result2 = (AdminVO)adminbiz.get(fff);
				
				if(  result2!=null && ((result2.getAdmin_pwd()).equals(admin_pwd)) ){
					session.setAttribute("loginuser2", result2);
					view.setLeft("managerleft");
					view.setFoot("login2");
					mv.setViewName("main");
				}
				
				else {
					log = "fail";
					request.setAttribute("log", log);
					request.setAttribute("register", register);
					mv.setViewName("loginFail");

				}
				
			}

			
		}

		//====================================================================================
		if(mobile!=null &&!mobile.equals("")){
			mv.setViewName("mobile/mobilemain");
		}

		mv.addObject("view",view);
		return mv;
		
	}

	
	
	@RequestMapping(value="/logout.jargo",method=RequestMethod.GET)
	public ModelAndView logoutimpl(HttpServletRequest request){
		
		String mobile= request.getParameter("mobile");
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();
		}
		ModelAndView mv = new ModelAndView();
		View view = new View();
		mv.setViewName("main");
		view.setFoot("login");
		view.setLeft("left");
		mv.addObject("view",view);
		if(mobile!=null &&!mobile.equals("")){
			mv.setViewName("mobile/mobilemain");
		}
		return mv;
	}
	
	
	@ExceptionHandler(Exception.class)
	public ModelAndView error1(Exception e){
		ModelAndView mv = new ModelAndView();
		View view = new View();
		mv.setViewName("error");
		mv.addObject("view",view);
		mv.addObject("errorMsg",e);
		return mv;
	}
	
}


//mv.setViewName("") ""안에 jsp말고 다른 확장자 이동원할때는 "redirect:/main.do"그냥 이렇게 써주면 될것