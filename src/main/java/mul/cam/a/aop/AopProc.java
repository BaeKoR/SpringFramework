package mul.cam.a.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mul.cam.a.dto.MemberDto;

/*
	AOP(Aspect Oriented Programming): 관점지향
	목적: log, session (감시자)
	log4j의 역할 수행
*/

@Aspect
public class AopProc {
	//@Around("within(mul.cam.a.controller.*) or within(mul.cam.a.dao.*.*)")
	@Around("within(mul.cam.a.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		/* 완성 후 주석 풀기
		// session check
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if (request != null) {
			HttpSession session = request.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");
			if (login == null) {
				return "redirect:/sessionOut.do"; // controller에서 controller로 이동 시 redirect를 사용 == sendRedirect
				//return "forward:/sessionOut.do"; // controller에서 controller로 이동 시 forword를 사용 == forward
			}
		}
		*/
		// logger
		String signatureStr = joinpoint.getSignature().toShortString();
		
		try {
			Object obj = joinpoint.proceed();
			
			System.out.println("AOP log: " + signatureStr + " 메소드 실행 " + new Date());
			
			return obj;
		}
		finally {
			//System.out.println("실행 후: " + System.currentTimeMillis());
		}
	}
}





























