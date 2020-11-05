package jargo.control;

import jargo.biz.Biz;
import jargo.vo.CustomerVO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import view.View;

@Controller
public class CustomerControl {
	
	@Autowired
	@Qualifier("CustomerBIZ")
	
	Biz biz;
	
	@RequestMapping(value="/registerImpl.jargo", method=RequestMethod.POST)
	public ModelAndView registerImpl(CustomerVO customer, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		View view = new View();
		CustomerVO check = (CustomerVO)biz.get(customer);
		String log = "OK";
		String register = "OK";
		if(check == null){
			biz.register(customer);
			mv.setViewName("main");
		} else {
			register = "fail";
			request.setAttribute("log", log);
			request.setAttribute("register", register);
			mv.setViewName("loginFail");
		}
		mv.addObject("view", view);
		return mv;
	}
	@RequestMapping(value="/modifyImpl.jargo", method=RequestMethod.POST)
	public ModelAndView modifyimpl(CustomerVO c,HttpServletRequest request){
		
		String mobile= request.getParameter("mobile");
		ModelAndView mv = new ModelAndView();
		biz.modify(c);
		
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();
		}

		if(mobile==null || mobile.equals("")){
		View view = new View();
		mv.addObject("view", view);
		mv.setViewName("main");

		}
		else
			mv.setViewName("mobile/mobilemain");
		return mv;
	}
	
	@RequestMapping(value="/clist.jargo")
	public @ResponseBody ArrayList<Object> list() {
//		System.out.println("clistjargo까지 들어온다.");
		ArrayList<Object> list = biz.getAll();
		
		//ModelAndView mv = new ModelAndView();
		//mv.setViewName("main"); // 이걸 안써주면 clist.jargo를 찾는다.
		//View view = new View();
		//view.setLeft("owner/ownerleft");
		//view.setCenter("owner/customerlist");
		//mv.addObject("customers", list);
		//mv.addObject("view", view);
//		System.out.println("list size : " + list.size());
//		System.out.println("list  :  " + list);
		return list ;
	}



	
	
	
}
