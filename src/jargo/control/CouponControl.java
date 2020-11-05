package jargo.control;


import jargo.biz.Biz;
import jargo.vo.CouponCommand;
import jargo.vo.CouponVO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import view.View;

@Controller
public class CouponControl {

	@Autowired
	@Qualifier("CouponBiz")
	Biz couponbiz;

	
	@RequestMapping(value="/couponbystore.jargo",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> couponselectbystoreimpl (@RequestParam(value="store_number") int store_number){
//		System.out.println("coupon by store 에 들어왔어요 store_nuber : "+store_number);
		CouponVO c = new CouponVO(0, "", "", 0, store_number, "");
		ArrayList<Object> result = couponbiz.getByStore(c);
//		System.out.println("size : "+result.size());
//		System.out.println(result); 
		return result;
	}
	
	@RequestMapping(value="/couponregisterimpl.jargo",method=RequestMethod.POST)
	public @ResponseBody void couponregisterimpl (CouponCommand cc)throws IOException{
		
//		System.out.println("couponregisterimpl 들어왔어요");
		String coupon_id = cc.getCoupon_id();
		String coupon_expired = cc.getCoupon_expired();
		int coupon_usable = cc.getCoupon_usable();
		int store_number = cc.getStore_number();
		MultipartFile file = cc.getFile();
		String coupon_img = file.getOriginalFilename();
		
//		System.out.println("couponregisterimpl couponregisterimpl");
//		System.out.println(coupon_img);
		
		FileOutputStream output = new FileOutputStream("C:/Users/user/Desktop/coupon"+coupon_img);
		byte[] fileData = file.getBytes();
		output.write(fileData);
		CouponVO c = new CouponVO(coupon_id, coupon_expired, coupon_usable, store_number, coupon_img);
		couponbiz.register(c);	
		
	}
	
	@RequestMapping(value="/coupondeleteimpl.jargo",method=RequestMethod.GET)
	public @ResponseBody void coupondeleteimpl (@RequestParam(value="coupon_number") int coupon_number){
//		System.out.println("coupon delete impl 왔어요");
		CouponVO c = new CouponVO(coupon_number);
		couponbiz.remove(c);
	}
	
	
	
	
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e){
		ModelAndView mv = new ModelAndView();
		View view = new View();
		mv.addObject("view",view);
		mv.addObject("e",e.toString());
		mv.setViewName("main");
		
		return mv;
	}
	
	
	
	
}
