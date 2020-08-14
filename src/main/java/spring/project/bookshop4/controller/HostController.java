package spring.project.bookshop4.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.bookshop4.service.HostService;


@Controller
public class HostController {
	
	@Autowired
	HostService hostService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;  // 비밀번호 암호화 객체
	
	// HomeController.java는 주석처리
	// value = {'/', '/user/main'}
	@RequestMapping(value = {"/host", "/host/main" ,"/host/04result"})
	public String main(HttpServletRequest request, Model model) {
		hostService.result(request, model);
		
		return "host/04result";
	}
	//재고 출력
	@RequestMapping("/host/01stockList")
	public String stockList(HttpServletRequest request, Model model) {
		hostService.stockList(request, model);
		
		return "host/01stockList";
	}
	
	//재고 정보 수정 -페이지
	@RequestMapping("/host/01editStock")
	public String editStock(HttpServletRequest request, Model model) {
		hostService.editStock(request, model);
		
		return "host/01editStock";
	}
	//재고 정보 수정 - 진행
	@RequestMapping(value="/host/01editStockPro", method=RequestMethod.POST)
	public String editStockPro(MultipartHttpServletRequest req, Model model) {
		hostService.editStockPro(req, model);
		
		return "host/01editStock";
	}
	
	//재고 추가 - 페이지
	@RequestMapping("/host/01addStock")
	public String addStock(HttpServletRequest request, Model model) {
		
		return "host/01addStock";
	}
	
	//재고 추가 - 진행
	@RequestMapping(value="/host/01addStockPro", method=RequestMethod.POST)
	public String addStockPro(MultipartHttpServletRequest req, Model model) {
		hostService.addStock(req, model);
		
		return "host/01addStock";
	}
	
	//재고 추가 - 페이지
	@RequestMapping("/host/01deleteStockPro")
	public String deleteStockPro(HttpServletRequest request, Model model) {
		hostService.deletePro(request,model);
		
		return "host/01deleteStockPro";
	}
	
	//주문리스트 출력
	@RequestMapping("/host/02orderList")
	public String orderList(HttpServletRequest request, Model model) {
		hostService.orderList(request,model);
		
		return "host/02orderList";
	}

	//주문 취소 -단일
	@RequestMapping("/host/02orderCancel")
	public String orderCancel(HttpServletRequest request, Model model) {
		hostService.orderCancel(request,model);
		
		return "host/02orderPro";
	}

	//주문취소 - 여러개
	@RequestMapping("/host/02manyOrderCancel")
	public String manyOrderCancel(HttpServletRequest request, Model model) {
		hostService.manyOrderCancel(request,model);
		
		return "host/02orderPro";
	}
	
	//배송중으로 상태변경
	@RequestMapping("/host/02deliverPro")
	public String deliverPro(HttpServletRequest request, Model model) {
		hostService.deliverPro(request,model);
		
		return "host/02orderPro";
	}
	
	//배송중 리스트 출력
	@RequestMapping("/host/02deliverList")
	public String deliverList(HttpServletRequest request, Model model) {
		hostService.deliverList(request,model);
		
		return "host/02deliverList";
	}
	//배송완료로 상태변경
	@RequestMapping("/host/02ordered")
	public String changeOrdered(HttpServletRequest request, Model model) {
		hostService.changeOrdered(request,model);
		
		return "host/02orderPro";
	}
	
	//배송완료 목록 출력
	@RequestMapping("/host/02orderedList")
	public String orderedList(HttpServletRequest request, Model model) {
		hostService.orderedList(request,model);
		
		return "host/02orderedList";
	}
	//환불목록 출력
	@RequestMapping("/host/02refundList")
	public String refundList(HttpServletRequest request, Model model) {
		hostService.refundList(request,model);
		
		return "host/02refundList";
	}
	//손님 목록 출력
	@RequestMapping("/host/03guestList")
	public String guestList(HttpServletRequest request, Model model) {
		hostService.guestList(request,model);
		
		return "host/03guestList";
	}
	//손님 정보 수정 - 페이지
	@RequestMapping("/host/03guestEdit")
	public String guestEdit(HttpServletRequest request, Model model) {
		hostService.guestEdit(request,model);
		
		return "host/03guestEdit";
	}
	//손님 정보 수정 - 진행
	@RequestMapping("/host/03guestEditPro")
	public String guestEditPro(HttpServletRequest request, Model model) {
		hostService.guestEditPro(request,model);
		
		return "host/03guestDeletePro";
	}
	//손님 정보 삭제 - 진행
	@RequestMapping("/host/03deleteGuestPro")
	public String guestDeletePro(HttpServletRequest request, Model model) {
		hostService.guestDeletePro(request,model);
		
		return "host/03guestDeletePro";
	}
	//게시판 목록 출력
	@RequestMapping("/host/05boardList")
	public String boardList(HttpServletRequest request, Model model) {
		hostService.boardList(request,model);
		
		return "host/05boardList";
	}
	//게시판 글 상세
	@RequestMapping("/host/05board")
	public String board(HttpServletRequest request, Model model) {
		hostService.board(request,model);
		
		return "host/05board";
	}
	//게시판 글 업데이트
	@RequestMapping("/host/05boardUpdate")
	public String boardUpdate(HttpServletRequest request, Model model) {
		hostService.boardUpdate(request,model);
		
		return "host/05boardUpdate";
	}
	//게시판 답글 삭제
	@RequestMapping("/host/05boardReDel")
	public String boardReDel(HttpServletRequest request, Model model) {
		hostService.boardReDel(request,model);
		
		return "host/05boardUpdate";
	}
	
	//게시글 삭제
	@RequestMapping("/host/05boardDel")
	public String boardDel(HttpServletRequest request, Model model) {
		hostService.boardDel(request,model);
		
		return "host/05boardUpdate";
	}
	
	//게시글 답글 달기
	@RequestMapping("/host/05boardRe")
	public String boardRe(HttpServletRequest request, Model model) {
		hostService.boardRe(request,model);
		
		return "host/05boardUpdate";
	}
	
	//메세지 삭제처리
	@RequestMapping("/host/deleteMessage")
	public @ResponseBody int deleteMessage(HttpServletRequest request, Model model) {
		return hostService.deleteMessage(request,model);
	}
	
	//메세지 삭제처리 여러개
	@RequestMapping("/host/deleteMessages")
	public @ResponseBody int deleteMessages(HttpServletRequest request, Model model) {
		int i =hostService.deleteMessages(request,model);
		return i;
	}
}
