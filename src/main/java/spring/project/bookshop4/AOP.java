package spring.project.bookshop4;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import spring.project.bookshop4.persistence.ExtraDAO;
import spring.project.bookshop4.vo.MessageVO;

@Aspect
public class AOP {

	@Autowired
	ExtraDAO extraDAO;	
	
	@Pointcut("execution(* spring.project.bookshop4.controller.HostController.*(..))")
    public void message() {}
	
	@Pointcut("execution(* spring.project.bookshop4.controller.*.*(..)) or execution(* spring.project.bookshop4.service.*Impl.*(..)) or execution(* spring.project.bookshop4.persistence.*Impl.*(..))")
	public void log() {};
	
	private static final Logger logger = LoggerFactory.getLogger(AOP.class);
	static String name = ""; 
	static String type = "";

	//@Around("execution(* spring.project.bookshop4.controller.*.*(..)) or execution(* spring.project.bookshop4.service.*Impl.*(..)) or execution(* spring.project.bookshop4.persistence.*Impl.*(..))")
	@Around("log()")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable { 
		type = joinPoint.getSignature().getDeclaringTypeName(); 
		if (type.indexOf("Controller") > -1) { 
			name = "Controller \t: "; 
		} else if (type.indexOf("Service") > -1) { 
			name = "ServiceImpl \t: "; 
		} else if (type.indexOf("DAO") > -1) { 
			name = "DAO \t\t: "; 
		} 
		logger.info(name + type + "." + joinPoint.getSignature().getName() + "()"); 
		return joinPoint.proceed(); 
	}
	
	@Around("message()")
	public Object messageGet(ProceedingJoinPoint joinPoint) throws Throwable{
		//request쓰기 위한 문법, messageGet에 매개변수로 넣을 수가 없음.
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

		setMessage(req); 
		
		return joinPoint.proceed(); 
	}
	
	public void setMessage(HttpServletRequest req) {
		List<MessageVO> messageList = extraDAO.getMessage();
		int messageCnt = messageList.size();
		
		req.setAttribute("messageList",messageList);
		req.setAttribute("messageCnt",messageCnt);
	}
	
}
