package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.bookshop4.vo.BookVO;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, String>> getBookClass() {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.getBookClass");
	}

	@Override
	public List<BookVO> getNewBook() {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.getNewBook");
	}

	@Override
	public List<BookVO> getBestBook(String searchBookClass) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.getBestBook", searchBookClass);
	}

	@Override
	public List<BookVO> getGoodPriceBook() {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.getGoodPriceBook");
	}

	@Override
	public BookVO searchStockBook(String search) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BookDAO.searchStockBook", search);
	}

	@Override
	public int bookListCnt() {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BookDAO.bookListCnt");
	}

	@Override
	public int searchStockCnt(String search) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BookDAO.searchStockCnt", search);
	}

	@Override
	public List<BookVO> getList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.getList", map);
	}

	@Override
	public List<BookVO> searchStockList(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.searchStockList", map);
	}

	@Override
	public int bookSearchCnt1(String search) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BookDAO.bookSearchCnt1", search);
	}

	@Override
	public int bookSearchCnt2(Map<String, Object> map) {
		return sqlSession.selectOne("spring.project.bookshop4.persistence.BookDAO.bookSearchCnt2", map);
	}

	@Override
	public List<BookVO> bookSearch1(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearch1", map);
	}

	@Override
	public List<BookVO> bookSearch2(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearch2", map);
	}

	@Override
	public List<BookVO> bookSearchRecent1(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchRecent1", map);
	}

	@Override
	public List<BookVO> bookSearchRecent2(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchRecent2", map);
	}

	@Override
	public List<BookVO> bookSearchLow1(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchLow1", map);
	}

	@Override
	public List<BookVO> bookSearchLow2(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchLow2", map);
	}

	@Override
	public List<BookVO> bookSearchHigh1(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchHigh1", map);
	}

	@Override
	public List<BookVO> bookSearchHigh2(Map<String, Object> map) {
		return sqlSession.selectList("spring.project.bookshop4.persistence.BookDAO.bookSearchHigh2", map);
	}

	@Override
	public int buybook(Map<String, Object> map) {
		return sqlSession.update("spring.project.bookshop4.persistence.BookDAO.buybook", map);
	}

	@Override
	public int updateStock(BookVO book) {
		return sqlSession.update("spring.project.bookshop4.persistence.BookDAO.updateStock", book);
	}

	@Override
	public int add(BookVO book) {
		return sqlSession.insert("spring.project.bookshop4.persistence.BookDAO.add", book);
	}

	@Override
	public int deleteBook(String ISBN) {
		return sqlSession.delete("spring.project.bookshop4.persistence.BookDAO.deleteBook", ISBN);
	}
	
	
}