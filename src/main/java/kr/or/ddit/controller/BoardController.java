package kr.or.ddit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.BoardSevice;
import kr.or.ddit.vo.BoardVO;

@Controller
public class BoardController {
	   
	  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	  private static final String VIEW_PREFIX = "board/";
	  
	  @Autowired    //DI 
	  private BoardSevice boardservice;  //와 그 기능이 같다 private BoardSevice boardservice = new BoardService();  (new)를 스프링에서 관리해준다. 
	   
	  
	  
	   //리스트 출력
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home(Model model) {
		   
	     //데이터를 리스트로 받아온다. 
		   List<BoardVO>  list = boardservice.getBoardList();
		   
		   model.addAttribute("boardList", list);
		   
		   return "index";
	   }
	   
	   
	   
	   //글작성 버튼을 누르면  form페이지로 이동함 
	   @RequestMapping(value="/board/write", method =RequestMethod.GET)
	   public String loadBoardWrite() {
		   return VIEW_PREFIX+"write";
	   }
	   
	   
	   // write(FORM) 등록 페이지  (ajax로 넘긴 데이터 저장 ) 
	   @RequestMapping(value="/board/write", method = RequestMethod.POST) //ajax로 넘긴 데이터 출력 ! 
	   public @ResponseBody Boolean doBoardWrite(@RequestBody BoardVO boardVO) {// @ResponseBody  ajax로 넘긴 데이터 전체 출력하겠다 ! 
			
		   	  logger.debug("[ Call /board/write - POST ]");
		      logger.debug("==> Parameters        : " + boardVO.getTitle());
		      logger.debug("==> Parameters        : " + boardVO.getContent());
		      
		      return boardservice.setBoardList(boardVO);
		  
		   }
		   
	   }
	   
	   
	   
