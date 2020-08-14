package spring.project.bookshop4.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.project.bookshop4.vo.UserVO;

//로그인이 성공한 경우 자동으로 실행
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String id = request.getParameter("uid");
		String pwd = request.getParameter("upwd");
		String idsave = request.getParameter("idsave");
		String autoLogin = request.getParameter("autoLogin");
		String hostLogin = request.getParameter("hidden");
				
		
		UserVO vo = (UserVO) authentication.getPrincipal();
		System.out.println("UserVO : " + vo);
		
		String msg = authentication.getName() + "님 환영합니다.";
		request.setAttribute("msg", msg);
		
		if(id.equals("host")) {
			if(hostLogin.equals("hostLogin")) {

				System.out.println("host .equal 까지 됨?");
				response.sendRedirect("/bookshop4/host");
				return;
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/user/denied");
				String errMsg = "잘못된 접근입니다";
				System.out.println("errMsg : "+errMsg);
				request.setAttribute("errMsg", errMsg);
				dispatcher.forward(request, response);
				return;
			}
		}
		
		
		if(idsave !=null) {
			if(idsave.equals("Y")) {
				Cookie cookie = new Cookie("idsave", id);
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
			}else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					String cookieName= cookies[i].getName();
					if(cookieName.equals("idsave")) {
						Cookie cookie = new Cookie("idsave", "");
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		}
		request.getSession().setAttribute("id",id);
		if(autoLogin!=null) {
			if(autoLogin.equals("Y")) {
				request.getSession().setMaxInactiveInterval(-1);
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
		
	}

}
