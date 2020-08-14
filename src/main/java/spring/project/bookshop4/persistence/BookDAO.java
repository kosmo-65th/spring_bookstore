package spring.project.bookshop4.persistence;

import java.util.List;
import java.util.Map;

import spring.project.bookshop4.vo.BookVO;

public interface BookDAO {
	//책 카테고리들 가져오기
	public List<Map<String, String>> getBookClass();
	
	//메인 - 신간 책 목록 가져오기
	public List<BookVO> getNewBook();
	//메인 - 잘팔린 책 목록 가져오기
	public List<BookVO> getBestBook(String searchBookClass);
	//메인 - 할인율 높은 책 목록 가져오기
	public List<BookVO> getGoodPriceBook();
	
	//ISBN으로 책 가져오기
	public BookVO searchStockBook(String search);
	
	//재고 리스트 갯수 세기- 실험 안해봄
	public int bookListCnt();
	public int searchStockCnt(String search);
	//재고 리스트 가져오기 - 실험 안해봄
	public List<BookVO> getList(Map<String, Object> map);//int start, int end
	public List<BookVO> searchStockList(Map<String, Object> map);//int start, int end, String search
	
	//책 검색 - 이름/작가/출판사
	public int bookSearchCnt1(String search);
	public int bookSearchCnt2(Map<String, Object> map);//String search, String category
	public List<BookVO> bookSearch1(Map<String, Object> map);//int start, int end, String search
	public List<BookVO> bookSearch2(Map<String, Object> map);//int start, int end, String search, String category
	public List<BookVO> bookSearchRecent1(Map<String, Object> map);//int start, int end, String search
	public List<BookVO> bookSearchRecent2(Map<String, Object> map);//int start, int end, String search, String category
	public List<BookVO> bookSearchLow1(Map<String, Object> map);//int start, int end, String search
	public List<BookVO> bookSearchLow2(Map<String, Object> map);//int start, int end, String search, String category
	public List<BookVO> bookSearchHigh1(Map<String, Object> map);//int start, int end, String search
	public List<BookVO> bookSearchHigh2(Map<String, Object> map);//int start, int end, String search, String category
	
	//책 구매로 인해 재고량 줄어들기
	public int buybook(Map<String, Object> map);//String ISBN, int count
	//재고 수정
	public int updateStock(BookVO book);
	//재고 추가	
	public int add(BookVO book);
	//재고 삭제(실제)
	public int deleteBook(String ISBN);
}
