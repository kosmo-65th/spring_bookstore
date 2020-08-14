package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int boardCnt() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BoardDAO.boardCnt");
	}

	@Override
	public int searchBoardCnt(String search) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BoardDAO.searchBoardCnt", search);
	}

	@Override
	public List<BoardVO> getBoardList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BoardDAO.getBoardList", map);
	}

	@Override
	public List<BoardVO> searchBoardList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BoardDAO.searchBoardList", map);
	}

	@Override
	public BoardVO getBoard(int boardNum) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BoardDAO.getBoard", boardNum);
	}

	@Override
	public int reUpdate(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.BoardDAO.reUpdate", map);
	}

	@Override
	public int boardReDel(int boardNum) {
		return sqlSession.delete("spring.project.bookshop4.persistence.BoardDAO.boardReDel", boardNum);
	}

	@Override
	public int updateRe(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.BoardDAO.updateRe", map);
	}

	@Override
	public int boardDel(int boardNum) {
		return sqlSession.delete("spring.project.bookshop4.persistence.BoardDAO.boardDel", boardNum);
	}

	@Override
	public int makeRe(Map<String, Object> map) {
		return sqlSession.insert("spring.project.bookshop4.persistence.BoardDAO.makeRe", map);
	}
}
