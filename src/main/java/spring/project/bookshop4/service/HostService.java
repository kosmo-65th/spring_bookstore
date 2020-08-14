package spring.project.bookshop4.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HostService {
	//결산
	public void result(HttpServletRequest request, Model model);
	
	//재고 보기
	public void stockList(HttpServletRequest request, Model model);
	//재고 책 추가
	public void addStock(MultipartHttpServletRequest req, Model model);
	//재고 수정창 표시
	public void editStock(HttpServletRequest request, Model model);
	//재고 수정 
	public void editStockPro(MultipartHttpServletRequest req, Model model);
	//재고 삭제
	public void deletePro(HttpServletRequest request, Model model);
	
	//주문목록 출력
	public void orderList(HttpServletRequest request, Model model);
	//주문 취소
	public void orderCancel(HttpServletRequest request, Model model);
	//주문여러개 취소
	public void manyOrderCancel(HttpServletRequest request, Model model);
	//주문 송장번호 넣기
	public void deliverPro(HttpServletRequest request, Model model);
	
	//배송중 목록 출력
	public void deliverList(HttpServletRequest request, Model model);
	//배송중 배송완료로 변경
	public void changeOrdered(HttpServletRequest request, Model model);
	
	//주문완료 목록 출력
	public void orderedList(HttpServletRequest request, Model model);
	//환불 목록 출력
	public void refundList(HttpServletRequest request, Model model);
	
	//손님 목록 보기
	public void guestList(HttpServletRequest request, Model model);
	//손님 내용 상세보기
	public void guestEdit(HttpServletRequest request, Model model);
	//손님 정보 수정
	public void guestEditPro(HttpServletRequest request, Model model);
	//손님 정보 삭제
	public void guestDeletePro(HttpServletRequest request, Model model);

	//게시판 리스트 출력
	public void boardList(HttpServletRequest request, Model model);
	//게시판 내용 출력
	public void board(HttpServletRequest request, Model model);
	//게시판 답변 수정
	public void boardUpdate(HttpServletRequest request, Model model);
	//게시판 답변 삭제
	public void boardReDel(HttpServletRequest request, Model model);
	//게시판 글 삭제
	public void boardDel(HttpServletRequest request, Model model);
	//게시판 답글 달기
	public void boardRe(HttpServletRequest request, Model model);
	
	//메세지 삭제
	public int deleteMessage(HttpServletRequest request, Model model);
	//메세지 삭제 - 여러개
	public int deleteMessages(HttpServletRequest request, Model model);
}
