package spring.project.bookshop4.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.project.bookshop4.service.GuestService;


@Controller
public class GuestController {
	
	@Autowired
	GuestService guestService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;  // 비밀번호 암호화 객체
	
	// HomeController.java는 주석처리
	// value = {'/', '/user/main'}
	@RequestMapping(value = {"/", "/user/main", "/main" })
	public String main(HttpServletRequest request, Model model) {
		guestService.mainPage(request, model);
		
		return "main";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		guestService.login(request, model);
		
		return "guest/login";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/admit")
	public String join() {
		return "guest/admit";
	}
	
	//아이디 중복확인
	@RequestMapping("/confirmId")
	public String confirmId(@RequestParam String id, Model model) {
		guestService.confirmId(id, model);
		
		return "guest/confirmId";	
	}

	// 회원가입 처리
	@RequestMapping("/admitPro")
	public String admitPro(HttpServletRequest req, Model model) {
		guestService.admit(req, model);
		
		return "guest/admitPro";
	}
	
	// 로그아웃 처리
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		SecurityContextHolder.clearContext();
		
		return "redirect:/";
	}
	
	//아이디 찾기
	@RequestMapping("/rememberId")
	public String rememberId(HttpServletRequest req, Model model) {
		guestService.rememberId(req, model);
		
		return "guest/rememberId";
	}

	//비밀번호 찾기
	@RequestMapping("/rememberPwd")
	public String rememberPwd(HttpServletRequest req, Model model) {
		guestService.rememberPwd(req, model);
		
		return "guest/rememberPwd";
	}
	//책 상세
	@RequestMapping("/bookDetail")
	public String bookDetail(HttpServletRequest req, Model model) {
		guestService.bookDetail(req, model);
		
		return "bookDetail";
	}
	//검색
	@RequestMapping("/searchList")
	public String searchList(HttpServletRequest req, Model model) {
		guestService.searchList(req, model);
		
		return "searchList";
	}
	//검색리스트 - 여러개 체크 구매
	@RequestMapping("/guest/buybookList")
	public String buybookList(HttpServletRequest req, Model model) {
		guestService.buybookList(req, model);
		
		return "guest/buyBook";
	}
	//검색리스트 - 단일 구매
	@RequestMapping("/guest/buyBook")
	public String buyBook(HttpServletRequest req, Model model) {
		guestService.buyBook(req, model);
		
		return "guest/buyBook";
	}
	
	//검색 리스트 - 단일 쇼핑카트
	@RequestMapping("/guest/shoppingCartPro")
	public String shoppingCartPro(HttpServletRequest req, Model model) {
		guestService.shoppingCartAdd(req, model);
		
		return "guest/shoppingCartPro";
	}
	
	//검색 리스트 - 선택 쇼핑카트
	@RequestMapping("/guest/shoppingCartListPro")
	public String shoppingCartListPro(HttpServletRequest req, Model model) {
		guestService.shoppingCartListPro(req, model);
		
		return "guest/shoppingCartPro";
	}
	
	//구매처리
	@RequestMapping("/guest/buyBookPro")
	public String buyBookPro(HttpServletRequest req, Model model) {
		guestService.buyBookPro(req, model);
		
		return "guest/buyBookPro";
	}
	
	//마이페이지
	@RequestMapping("/guest/myPage")
	public String myPage(HttpServletRequest req, Model model) {
		guestService.myPage(req, model);
		
		return "guest/myPage";
	}
	
	//쇼핑카트 - 구매
	@RequestMapping("/guest/buyBookForCart")
	public String buyBookForCart(HttpServletRequest req, Model model) {
		guestService.buyBookForCart(req, model);
		
		return "guest/buyBook";
	}
	
	//관리자 로그인
	@RequestMapping("/admin")
	public String admin(HttpServletRequest req, Model model) {
		String password = req.getParameter("password");
		
		model.addAttribute("hostLogin", "host");
		model.addAttribute("hostPassword", password);
		
		return "guest/login";
	}
	
	//권한 없을 때 가는 곳
	@RequestMapping("/user/denied")
	public String userDenied(HttpServletRequest req, Model model) {
		String errMsg = (String)req.getAttribute("errMsg");
		model.addAttribute("errMsg",errMsg);
		return "user/denied";
	}
	
	//게시판
	@RequestMapping("/guest/boardList")
	public String boardList(HttpServletRequest req, Model model) {
		guestService.boardList(req, model);
		
		return "guest/boardList";
	}
}
