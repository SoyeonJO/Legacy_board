package kr.or.ddit.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BoardVO;

@Repository
public interface BoardMapper {

	    /**
	     * @Author : JSY
	     * @Date : 2019. 11. 22.
	     * @return : List<BoardVO>
	     * @Param : 
	     * @Throws : 
	     * @method 설명 :  
	     */
	    public List<BoardVO> selectBoardList();
	    /**
	     * @Author : JSY
	     * @Date : 2019. 11. 22.
	     * @return : int
	     * @Param : 
	     * @Throws : 
	     * @method 설명 :  
	     */
	    public int insertBoard(BoardVO boardVO);
	    
	     
	   
	    
	    
}
