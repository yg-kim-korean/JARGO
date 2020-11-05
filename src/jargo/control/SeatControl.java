package jargo.control;

import jargo.biz.Biz;
import jargo.vo.SeatCommand;
import jargo.vo.SeatVO;
import jargo.vo.StoreVO;

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
public class SeatControl {
	@Autowired
	@Qualifier("StoreBiz")
	Biz storebiz;
	@Autowired
	@Qualifier("SeatBiz")
	Biz seatbiz;
	@RequestMapping(value="/seat_list.jargo",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> storeselectbyownerimpl (@RequestParam(value="owner_id") String owner_id){
		StoreVO s = new StoreVO(owner_id);
		StoreVO result = null;
		result = (StoreVO) storebiz.getByOwner(s);
		ArrayList<Object> list = seatbiz.getSeatlist(result);
		return list;
	}
	
	@RequestMapping(value = "/seatregisterimpl.jargo", method = RequestMethod.POST)
	   public @ResponseBody void seatregisterimpl(SeatCommand svo) throws IOException {
      
	      int store_number = svo.getStore_number();
	      int seat_persons = svo.getSeat_persons();
	      String seat_status = svo.getSeat_status();
	      String seat_location = svo.getSeat_location();
	      MultipartFile file = svo.getFile();
	      String seat_img = file.getOriginalFilename();
	      int seat_number=svo.getSeat_number();
	      
	      
	      if(seat_img != null){
	         FileOutputStream output = new FileOutputStream(
	               "C:/Users/user/Desktop/seat" + seat_img);
	         byte[] fileData = file.getBytes();
	         output.write(fileData);
	      }
	      
	      SeatVO vo = new SeatVO(seat_location,seat_number,seat_img,store_number,seat_persons, seat_status);
	      seatbiz.register(vo);      
	    
	   }
	
	@RequestMapping(value = "/seatdelete.jargo", method = RequestMethod.POST)
	public @ResponseBody void seatdelete(SeatVO vo){
		seatbiz.remove(vo);
	}
	@RequestMapping(value = "/seatmodify.jargo", method = RequestMethod.POST)
	   public @ResponseBody void seatmodify(SeatCommand svo) throws IOException {
	      int seat_number=svo.getSeat_number();
	      int store_number = svo.getStore_number();
	      int seat_persons = svo.getSeat_persons();
	      String seat_status = svo.getSeat_status();
	      String seat_location = svo.getSeat_location();
	      String seat_img = null;
	      
	      MultipartFile file = svo.getFile();
	      
	      SeatVO originp = (SeatVO)seatbiz.get(new SeatVO(seat_location,store_number));
	   
	      seat_img =file.getOriginalFilename();
	      
	  	if(seat_img==null || seat_img.equals("")){
	  		seat_img = originp.getSeat_img();
		}else{

			FileOutputStream output = new FileOutputStream("images/seat/"+seat_img);

			seat_img =  file.getOriginalFilename();
			
			byte[] fileData = file.getBytes();
			output.write(fileData);
	    	   }
	SeatVO seat = new SeatVO(seat_location,seat_number,seat_img,store_number,seat_persons,seat_status);
	seatbiz.modify(seat);
	}
	@RequestMapping(value="/seat_detail.jargo",method=RequestMethod.GET)
	public @ResponseBody Object seat_detail (@RequestParam(value="store_number") int store_number,@RequestParam(value="seat_location") String seat_location){
	System.out.println(seat_location+"  "+store_number);
	SeatVO vo = new SeatVO(seat_location,store_number);
	SeatVO result = (SeatVO) seatbiz.get(vo);
	System.out.println(result);
	return result;
	}
	
	@RequestMapping(value="/seat_all.jargo",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> seatall (){
		ArrayList<Object> list = seatbiz.getAll();
		System.out.println(list);
		return list;
	}
	@RequestMapping(value="/getSeat.jargo",method=RequestMethod.GET)
	public @ResponseBody SeatVO getSeat (@RequestParam(value="seat_number") int seat_number){
		SeatVO vo = new SeatVO(seat_number);
		return (SeatVO) seatbiz.getByOwner(vo);
	}


}