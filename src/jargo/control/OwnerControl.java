package jargo.control;

import jargo.biz.Biz;
import jargo.vo.OwnerVO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import view.View;

@Controller
public class OwnerControl {

	@Autowired
	@Qualifier("OwnerBiz")
	Biz biz;
	
	@RequestMapping(value = "/ownerregisterimpl.jargo", method = RequestMethod.POST)
	public @ResponseBody void seatregisterimpl(OwnerVO ovo){
		System.out.println(ovo);
		biz.register(ovo);
	}
	
	
	@RequestMapping(value="/modifyimpl_owner.jargo", method=RequestMethod.POST)
	public ModelAndView modifyimpl1(OwnerVO o,HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		biz.modify(o);
		
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();
		}
		View view = new View();
		mv.addObject("view", view);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/ownerdeleteimpl.jargo")
	public @ResponseBody void ownerdeleteimpl(@RequestParam(value="owner_id") String owner_id){
		System.out.println("OwnerControl ownerdeleteimpl");
		System.out.println("owner_id: " + owner_id);
		OwnerVO vo  = new OwnerVO(owner_id);
		System.out.println(vo);
		biz.remove(vo);
	}

	
	@RequestMapping(value="/ownerlist.jargo")
	public @ResponseBody ArrayList<Object> list() {
		ArrayList<Object> list  = biz.getAll();		
		return list;
	}

	
	
	
}
