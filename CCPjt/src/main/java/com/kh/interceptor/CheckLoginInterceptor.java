package com.kh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.domain.UserInfoVo;


public class CheckLoginInterceptor extends HandlerInterceptorAdapter{
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserInfoVo UserVo = (UserInfoVo)session.getAttribute("UserVo");
		if(UserVo == null) {
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			String targetLocation = uri + "?" + queryString;
			System.out.println("uri = "+uri);
			System.out.println("queryString = "+queryString);
			System.out.println("targetLocation = "+targetLocation);
			session.setAttribute("targetLocation", targetLocation);
			response.sendRedirect("/login");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
