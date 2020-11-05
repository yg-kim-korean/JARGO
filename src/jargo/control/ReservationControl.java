package jargo.control;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import jargo.biz.Biz;
import jargo.biz.ReservationBiz;
import jargo.biz.TimeBiz;
import jargo.vo.CustomerVO;
import jargo.vo.ReservationVO;
import jargo.vo.SeatVO;
import jargo.vo.TimeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.Select;

@Controller
public class ReservationControl {

	
	@Autowired
	@Qualifier("ReservationBiz")
	ReservationBiz reservationbiz;
	
	@Autowired
	@Qualifier("TimeBiz")
	TimeBiz timebiz;
	
	@RequestMapping(value="/getstoreonreser.jargo" , method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> getstorenumber(@RequestParam(value="customer_id") String customer_id){
		ReservationVO vo = new ReservationVO(customer_id);
		return reservationbiz.getSort(vo);
	}
	
	@RequestMapping(value="/timeandreservationregister.jargo",method=RequestMethod.GET)
	public @ResponseBody void seat_detail (@RequestParam(value="customer_id") String cusomter_id,@RequestParam(value="store_number") int store_number
			,@RequestParam(value="reservation_date") String reservation_date,@RequestParam(value="reservation_time") String reservation_time,@RequestParam(value="seat_number") int seat_number){
		ReservationVO reservationvo = new ReservationVO(cusomter_id,store_number);

		reservationbiz.register(reservationvo);

		int seq = reservationbiz.maxseq();
		
		System.out.println("maxseq="+seq);

		TimeVO timevo = new TimeVO(seq,reservation_date,reservation_time,seat_number);
		
		timebiz.register(timevo);
	}
	@RequestMapping(value="/getstoreonreserbystore.jargo" , method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> getstoreonreserbystore(@RequestParam(value="store_number") int store_number){
		ReservationVO vo = new ReservationVO(0, store_number);
		return reservationbiz.getSeatlist(vo);
	}
	@RequestMapping(value="/Myreservationlist.jargo" , method=RequestMethod.GET)
	public @ResponseBody Object Myreservationlist(@RequestParam(value="store_number") int store_number,@RequestParam(value="reservation_number") int reservation_number){
		ReservationVO vo = new ReservationVO(reservation_number, store_number);
		return reservationbiz.getByOwner(vo);
	}
	@RequestMapping(value="/reservationlist.jargo" , method=RequestMethod.GET)
	public @ResponseBody Object reservationlist(@RequestParam(value="reservation_number") int reservation_number){
		ReservationVO vo = new ReservationVO(reservation_number);
		return reservationbiz.get(vo);
	}
	@RequestMapping(value="/reservationdelete.jargo" , method=RequestMethod.GET)
	public @ResponseBody void reservationdelete(@RequestParam(value="reservation_number") int reservation_number){
		System.out.println(reservation_number);
		TimeVO vo2 = new TimeVO(reservation_number);
		timebiz.remove(vo2);
		ReservationVO vo = new ReservationVO(reservation_number);
		reservationbiz.remove(vo);
		System.out.println("delete..");
	}
	
}
