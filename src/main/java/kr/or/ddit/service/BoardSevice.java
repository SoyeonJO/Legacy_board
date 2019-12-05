package kr.or.ddit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.mapper.BoardMapper;
import kr.or.ddit.vo.BoardVO;

@Service
public class BoardSevice {
	
     @Autowired 
     private BoardMapper boardMapper;
     
     
     /**
     * @Author : JSY
     * @Date : 2019. 11. 22.
     * @return : List<BoardVO>
     * @Param : 
     * @Throws : 
     * @method 설명 :  
     */
    public List<BoardVO> getBoardList(){
    	 
    	 List<BoardVO> list = boardMapper.selectBoardList(); // 리스트받아오기 
         int listSize = list.size();   

         for(int i=0; i<listSize; i++) {   //데이터에 등록된 게시물사이즈 만큼 for문 돌려라 
            int boardNo = listSize-i;   
            list.get(i).setNo(boardNo);
         }
         
         return list;
     }
     
     
     /**
     * @Author : JSY
     * @Date : 2019. 11. 22.
     * @return : boolean
     * @Param : 
     * @Throws : 
     * @method 설명 :  
     */
    public Boolean setBoardList(BoardVO boardVO) {
         
         int rows = boardMapper.insertBoard(boardVO);
         boolean flag = false;
         
         if(rows > 0) flag = true;
         
         return flag;
      }
     
     
     

}
