package jargo.control;

import jargo.biz.Biz;
import jargo.vo.TimeVO;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class TimeControl {
	@Autowired
	@Qualifier("TimeBiz")
	Biz timebiz;
	@Autowired
	@Qualifier("SeatBiz")
	Biz seatbiz;
	@RequestMapping(value="/timelist.jargo",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> timeseatlist (@RequestParam(value="reservation_date") String reservation_date,@RequestParam(value="reservation_time") String reservation_time){

		TimeVO vo = new TimeVO(reservation_date, reservation_time);
		ArrayList<Object> a = (ArrayList<Object>)timebiz.getSeatlist(vo); //date time에 맞는 timelist를 가져옴
		System.out.println(a);
		return a;
	}
	@RequestMapping(value="/getDateAndTime.jargo",method=RequestMethod.GET)
	public @ResponseBody TimeVO getDateAndTime (@RequestParam(value="reservation_number") int reservation_number){
		TimeVO vo = new TimeVO(reservation_number);

		return (TimeVO) timebiz.get(vo);
	}	

}