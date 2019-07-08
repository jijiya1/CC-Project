package com.kh.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.domain.UserInfoVo;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String keepLogin = request.getParameter("keepLogin");
		HttpSession session = request.getSession();
		UserInfoVo userVo = (UserInfoVo)session.getAttribute("userVo");
		if(userVo !=null) {
			if(keepLogin != null) {
				// 쿠키 생성
//				Cookie loginCookie = new Cookie("loginCookie", "true");
				Cookie idCookie = new Cookie("u_email", userVo.getU_email());
				// 쿠키의 유효기간 (second-초단위)
				int maxAge = 60*60*24*7;
//				loginCookie.setMaxAge(maxAge); //일주일
				idCookie.setMaxAge(maxAge);
//				response.addCookie(loginCookie);
				response.addCookie(idCookie);
				
			}else {
				Cookie[] cookies = request.getCookies();
				
				for(Cookie cookie : cookies) {
					String cookieName = cookie.getName();
					if(cookieName.equals("loginCookie") || cookieName.equals("u_email")) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						
					}
				}
			}
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
