package jargo.control;

import jargo.biz.Biz;
import jargo.vo.MenuCommand;
import jargo.vo.MenuVO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class MenuControl {
	@Autowired
	@Qualifier("MenuBiz")
	
	Biz biz;
	
	@RequestMapping(value="/menu.jargo" , method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> menus(@RequestParam( value="menu_category") String menu_category){
		
		MenuVO vo = new MenuVO(menu_category);
		ArrayList<Object> result = new ArrayList<Object>();
		result = biz.getSort(vo);
		

	      return result;
		

	}
	@RequestMapping(value="/menuall.jargo" , method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> menu(){
		
		
		ArrayList<Object> result = biz.getAll();
		
		
	      return result;
		

	}
	@RequestMapping(value = "/menuregisterimpl.jargo", method = RequestMethod.POST)
	public @ResponseBody void menuregisterimpl(MenuCommand mvo) throws IOException {
		System.out.println(mvo);
		String name = mvo.getMenu_name();
		int price = mvo.getMenu_price();
		String desc = mvo.getMenu_desc();
		String category = mvo.getMenu_category();
		MultipartFile file = mvo.getFile();
		String img = file.getOriginalFilename();		
		
		
		if(img != null){
			FileOutputStream output = new FileOutputStream("C:/sk/JARGO/web/images/" + img);

			byte[] fileData = file.getBytes();
			output.write(fileData);
		}
		
		MenuVO vo = new MenuVO(name, price, desc, img, category);
		System.out.println(vo);
		biz.register(vo);						
	}	
	
	@RequestMapping(value = "/menudeleteimpl.jargo")
	public @ResponseBody void menudeleteimpl(@RequestParam(value="menu_number") int menu_number){
		MenuVO vo = new MenuVO(menu_number);
		biz.remove(vo);
	}
	
	@RequestMapping(value = "/menuupdateimpl.jargo", method = RequestMethod.POST)
	public @ResponseBody void menuupdateimpl(MenuCommand mvo) throws IOException {
		System.out.println(mvo);
		int number = mvo.getMenu_number();
		String name = mvo.getMenu_name();
		int price = mvo.getMenu_price();
		String desc = mvo.getMenu_desc();
		String category = mvo.getMenu_category();
		MultipartFile file = mvo.getFile();
		String img = file.getOriginalFilename();	
		
		if (img == null || img.equals("")) {
			img = mvo.getMenu_img();
		}
		else{
			FileOutputStream output = new FileOutputStream(
					"C:/jsp/JARGO/web/images/" + img);
			byte[] fileData = file.getBytes();
			output.write(fileData);
		}
		System.out.println(img);
		MenuVO vo = new MenuVO(number, name, price, desc, img, category);
		biz.modify(vo);
	}
	
	@RequestMapping(value = "/menuselect.jargo")
	public @ResponseBody MenuVO menuselect(@RequestParam(value="menu_number") int menu_number){
		MenuVO vo = new MenuVO(menu_number);
		MenuVO result = (MenuVO)biz.get(vo);
		
		return result;
	}

}
