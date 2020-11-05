package jargo.control;

import jargo.biz.Biz;
import jargo.vo.BoardVO;

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
import org.springframework.web.servlet.ModelAndView;

import view.View;

@Controller
public class BoardControl {

	@Autowired
	@Qualifier("BoardBiz")
	
	Biz biz;
	
	/*@RequestMapping(value="/writeImpl.jargo", method=RequestMethod.POST)
	public ModelAndView writeImpl (BoardVO board, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		View view = new View();
		biz.register(board);
		BoardVO result = (BoardVO)biz.get(board);
		request.setAttribute("board", result);
		mv.addObject("view", view);
		mv.setViewName("main");
		return mv;
	}*/
	
	@RequestMapping(value="/writeImpl.jargo", method=RequestMethod.POST)
	public @ResponseBody void writeImpl (BoardVO board, HttpServletRequest request) {
		biz.register(board);
		BoardVO result = (BoardVO)biz.get(board);
		request.setAttribute("board", result);
	}
	
	@RequestMapping(value="/updateImpl.jargo", method=RequestMethod.GET)
	public @ResponseBody Object updateImpl (@RequestParam(value="board_number") int board_number,HttpServletRequest request) {
			
		BoardVO board = new BoardVO(board_number);
		BoardVO result = (BoardVO) biz.get(board);
		return result;
	}
	
	@RequestMapping(value="/realupdateImpl.jargo", method=RequestMethod.POST)
	public ModelAndView realupdateImpl (BoardVO board, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		biz.modify(board);
		View view = new View();
		mv.addObject("view", view);
		mv.setViewName("main");
		return mv;
		
	}
	
	@RequestMapping(value="/deleteImpl.jargo", method=RequestMethod.POST)
	public @ResponseBody void deleteImpl (BoardVO board, HttpServletRequest request) {
		biz.remove(board);
	}
	
	@RequestMapping(value="/board_list.jargo", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> list() {
		ArrayList<Object> list = biz.getAll();
		return list;
	}
	
	@RequestMapping(value="/board_list2.jargo",method=RequestMethod.GET)
	public @ResponseBody Object board_select (@RequestParam(value="board_number") int board_number){

		BoardVO board = new BoardVO(board_number);
		BoardVO result = (BoardVO) biz.get(board);
		return result;
	}
	
/*
	@RequestMapping(value="/boardselectbyownimpl.jargo",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Object> boardselectbystoreimpl (@RequestParam(value="store_number") int store_number){
		System.out.println("boardselectbystoreimpl µé¾î¿È");
		BoardVO b = new BoardVO(0, null, null, null, null, store_number);
		
	}
	*/

	/*@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e){
		ModelAndView mv = new ModelAndView();
		View view = new View();
		mv.addObject("view",view);
		mv.addObject("e",e.toString());
		mv.setViewName("main");
		
		return mv;
	}*/
	

}
