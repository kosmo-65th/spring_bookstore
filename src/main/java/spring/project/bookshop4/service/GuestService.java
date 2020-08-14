package spring.project.bookshop4.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

public interface GuestService {
	
	//main 페이지
	public void mainPage(HttpServletRequest request, Model model);
	
	//회원가입
	public void admit(HttpServletRequest request, Model model);
	//회원가입 - 아이디 중복확인
	public void confirmId(@RequestParam String id, Model model);
	
	
	//로그인 화면 - 자동로그인/아이디 저장
	public void login(HttpServletRequest request, Model model);
	//아이디 찾기
	public void rememberId(HttpServletRequest request, Model model);
	//비밀번호 찾기
	public void rememberPwd(HttpServletRequest request, Model model);
	
	//책 상세 내용
	public void bookDetail(HttpServletRequest request, Model model);
	
	//책 검색리스트
	public void searchList(HttpServletRequest request, Model model);

	//구매페이지 - 여러개
	public void buybookList(HttpServletRequest request, Model model);
	//구매 페이지 - 단일
	public void buyBook(HttpServletRequest request, Model model);
	//장바구니 추가 - 단일
	public void shoppingCartAdd(HttpServletRequest request, Model model);
	//장바구니 추가 - 여러개
	public void shoppingCartListPro(HttpServletRequest request, Model model);
	
	//구매 실행
	public void buyBookPro(HttpServletRequest request, Model model);
	
	//마이페이지
	public void myPage(HttpServletRequest request, Model model);
		
	//장바구니 - 구매
	public void buyBookForCart(HttpServletRequest request, Model model);
	
	//게시판 리스트
	public void boardList(HttpServletRequest request, Model model);
	//게시판 글
	public void board(HttpServletRequest request, Model model);
}
