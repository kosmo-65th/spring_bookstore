package spring.project.bookshop4.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping("/error_500")
	public String error_500(HttpServletRequest request, Model model) {
		return "error/error_500";
	}
	
	@RequestMapping("/error_404")
	public String error_404(HttpServletRequest request, Model model) {
		return "error/error_404";
	}
}
