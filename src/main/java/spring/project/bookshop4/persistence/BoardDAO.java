package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.BoardVO;

@Repository
public interface BoardDAO {
	//게시판 목록 가져오기
	public int boardCnt();
	public int searchBoardCnt(String search);
	//주문신청 목록 가져오기
	public List<BoardVO> getBoardList(Map<String, Object> map);//int start, int end
	public List<BoardVO> searchBoardList(Map<String, Object> map);//int start, int end, String search
	
	//글 가져오기
	public BoardVO getBoard(int boardNum);
	//답변 수정
	public int reUpdate(Map<String, Object> map);//int boardNum, String re_content
	//답변 삭제
	public int boardReDel(int boardNum);
	//board 테이블 답변 없음/있음으로 바꾸기
	public int updateRe(Map<String, Object> map);//int boardNum, String str
	//글 삭제
	public int boardDel(int boardNum);
	//답글 등록
	public int makeRe(Map<String, Object> map);//int boardNum, String re_content
}
