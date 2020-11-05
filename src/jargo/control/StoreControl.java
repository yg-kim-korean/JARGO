package jargo.control;

import jargo.biz.Biz;
import jargo.vo.OwnerVO;
import jargo.vo.StoreCommand;
import jargo.vo.StoreVO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class StoreControl {

	@Autowired
	@Qualifier("StoreBiz")
	Biz biz;

	@Autowired
	@Qualifier("OwnerBiz")
	Biz ownerbiz;

	@RequestMapping(value = "/storebyowner.jargo", method = RequestMethod.GET)
	public @ResponseBody Object storeselectbyownerimpl(@RequestParam(value = "owner_id") String owner_id) {
//		System.out.println("storebyowner에 들어왔어요");
//		System.out.println("222222222"+owner_id);

		StoreVO s = new StoreVO(owner_id);
		StoreVO result = null;
		result = (StoreVO) biz.getByOwner(s);
		// System.out.println("3333333333"+s);
//		System.out.println("4444444444444"+result.getOwner_id() );
//		System.out.println("4444444444444"+result.getStore_number() );
		return result;
	}

	@RequestMapping(value = "/getstores.jargo", method = RequestMethod.GET)
	public @ResponseBody
	ArrayList<Object> getstores() {
		ArrayList<Object> result = biz.getAll();

		return result;
	}

	@RequestMapping(value = "/storemodifyimpl.jargo", method = RequestMethod.POST)
	public ModelAndView storemodifyimpl(StoreCommand sc,HttpServletRequest request) throws IOException {
//		System.out.println("=========store==========");
		int store_number = sc.getStore_number();
		String store_name = sc.getStore_name();
		String store_phone = sc.getStore_phone();
		String store_addr = sc.getStore_addr();
		String store_desc = sc.getStore_desc();
		String store_subway = sc.getStore_subway();
		
//		new
		MultipartFile file = sc.getFile();
		String store_img = file.getOriginalFilename();
//		System.out.println("new image : "+store_img);
//		old
		String store_img_b = sc.getStore_img();
//		System.out.println("old image : "+store_img_b);

		String store_lat = sc.getStore_lat();
		String store_lng = sc.getStore_lng();
		String owner_id = sc.getOwner_id();
		int master_number = sc.getMaster_number();

		if (store_img == null || store_img.equals("")) {	//old
			
//			System.out.println("old modify");
			
			StoreVO s = new StoreVO(store_number, store_name, store_phone,
					store_addr, store_desc, store_subway, store_img_b,
					store_lat, store_lng, master_number, owner_id);
//			System.out.println(s);
			biz.modify(s);
		} else {	//new
			
//			System.out.println("new modify");
			
			FileOutputStream output = new FileOutputStream
					("C:/sk/JARGO/web/images/store/" + store_img);
			byte[] fileData = file.getBytes();
			output.write(fileData);
			StoreVO s = new StoreVO(store_number, store_name, store_phone,
					store_addr, store_desc, store_subway, store_img, store_lat,
					store_lng, master_number, owner_id);
//			System.out.println(s);
			biz.modify(s);
		}

		HttpSession session = request.getSession(false);
		String owner_id1 = sc.getOwner_id();
		OwnerVO result = new OwnerVO(owner_id1, null, null, null, null);
		OwnerVO result1 = (OwnerVO) ownerbiz.get(result);
		session.setAttribute("loginuser1", result1);
		ModelAndView mv = new ModelAndView();
		View view = new View();
		view.setLeft("ownerleft");
		view.setFoot("login1");
		mv.setViewName("main");
		mv.addObject("view", view);
		return mv;
	}

	@RequestMapping(value = "/storeregisterimpl.jargo", method = RequestMethod.POST)
	public @ResponseBody
	void storeregisterimpl(StoreCommand svo) throws IOException {
		int number = svo.getStore_number();
		String id = svo.getOwner_id();
		String name = svo.getStore_name();
		String phone = svo.getStore_phone();
		String addr = svo.getStore_addr();
		String desc = svo.getStore_desc();
		String subway = svo.getStore_subway();
		String lat = svo.getStore_lat();
		String lng = svo.getStore_lng();
		int master_number = svo.getMaster_number();
		MultipartFile file = svo.getFile();
		String img = file.getOriginalFilename();
		System.out.println(svo);

		if (img != null) {
			FileOutputStream output = new FileOutputStream("C:/sk/JARGO/web/images/store/" + img);

			byte[] fileData = file.getBytes();
			output.write(fileData);
		}
		System.out.println(svo);
		System.out.println("객체생성전");
		StoreVO vo = new StoreVO(number, id, name, phone, addr, desc, subway,
				img, lat, lng, master_number);
		System.out.println(vo);
		biz.register(vo);

	}

	@RequestMapping(value = "/storelist.jargo")
	public @ResponseBody
	ArrayList<Object> list() {
		ArrayList<Object> list = biz.getAll();
		return list;
	}

	@RequestMapping(value = "/storedeleteimpl.jargo")
	public @ResponseBody
	void storedeleteimpl(@RequestParam(value = "store_number") int store_number) {
		StoreVO vo = new StoreVO(store_number);
		biz.remove(vo);
	}

	@RequestMapping(value = "/storeselect.jargo")
	public @ResponseBody StoreVO storeselect(@RequestParam(value = "store_number") int store_number) {
		StoreVO vo = new StoreVO(store_number);
		StoreVO result = (StoreVO) biz.get(vo);

		return result;
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		ModelAndView mv = new ModelAndView();
		View view = new View();
		mv.addObject("view", view);
		mv.addObject("e", e.toString());
		mv.setViewName("main");

		return mv;
	}

}
