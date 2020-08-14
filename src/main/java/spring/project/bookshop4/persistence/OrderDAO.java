package spring.project.bookshop4.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.project.bookshop4.vo.OrderVO;

public interface OrderDAO {
	////host- 출력 공통부분
	//데이터 갯수
	public int commonOrderCnt(String status);
	//검색 했을 때 데이터 갯수
	public int commonSearchOrderCnt(Map<String, Object> map);//String search, String status
	//데이터 리스트
	public List<OrderVO> commonGetOrderList(Map<String, Object> map);//String status, int start, int end
	//검색했을 때 데이터 리스트
	public List<OrderVO> commonSearchOrderList(Map<String, Object> map);//String status, int start, int end, String search
	//주문 상태 업데이트
	public int commonOrderUpdate(Map<String, Object> map);//int orderNum, String status
	
	////host- 출력 공통부분
	
	//손님 - 장바구니 체크
	public int shoppingCartCheck(Map<String, Object> map);//String ISBN, String id
	//손님 - 장바구니 추가
	public int shoppingCartAdd(Map<String, Object> map);//String ISBN, int count, String id;
	
	//손님 구매중
	public int buyBookPro(Map<String, Object> map);//String ISBN, int count, int price, String id;
	//손님 구매완료로 장바구니에서
	public int deleteFromCart(Map<String, Object> map);//String ISBN, String id
	
	//손님 - 장바구니 목록 가져오기
	public List<OrderVO> getShoppingCartList(String id);
	
	//손님 - 주문목록 가져오기
	public List<OrderVO> getOrderList(String id);
	
	
	//배송으로 상태 변경
	public int deliverPro(Map<String, Object> map);//int orderNum, String deliver
	//주문 완료로 변경
	public int changeOrdered(Map<String, Object> map);//int orderNum, String deliver
	
	//결산 달별 합 가져오기
	public int resultMonthly();
	//결산 년별 합 가져오기
	public int resultYearly();
	//결산 총 주문건수
	public int resultMonthlyCnt();
	//결산 년별 주문건수
	public int resultYearlyCnt();
		
	//결산 그래프 자료(월별)
	public int graphMonthly(String month);
}
