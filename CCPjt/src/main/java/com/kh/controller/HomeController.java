package com.kh.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.domain.LoginDto;
import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.service.IUserJoinService;
import com.kh.service.IMainService;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	IUserJoinService userJoinService;
	
	@Inject
	IMainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,
			PagingDto pagingDto, NoSearchDto noSearchDto, NoPagingDto noPagingDto, Model model, Locale locale
			) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<NoticeBoardVo> noticeList = mainService.getNoticeBoardList(pagingDto);
		model.addAttribute("noticeList", noticeList);
		
		return "/main/main";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(String inputEmail, Model model, HttpServletRequest request) throws Exception{
		model.addAttribute("inputEmail", inputEmail);
		
		Cookie[] cookies = request.getCookies();
		String u_email = null;
		for(Cookie cookie : cookies) {
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			if(cookieName.equals("u_email")) {
				u_email = cookieValue;
			}
		}
		if(u_email != null) {
			String u_pw = userJoinService.searchPw(u_email);
			model.addAttribute("u_email", u_email);
			model.addAttribute("u_pw", u_pw);
		}
	}
	
	@RequestMapping(value = "/login_run", method = RequestMethod.POST)
	public String loginRun(LoginDto loginDto, HttpSession session, RedirectAttributes rttr) throws Exception{
		UserInfoVo userInfoVo = userJoinService.userLogin(loginDto);
		rttr.addFlashAttribute("message", "login");
		String page = "redirect:";
		if(userInfoVo==null) {
			page+="/login?inputEmail="+loginDto.getU_email();
		}else {
//			System.out.println("loginDto.getU_email() : " + loginDto.getU_email());
			session.setAttribute("userVo", userInfoVo);
			page+="/";
		}
		return page;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate(); // session.remove("memberVo");
		
		return "redirect:/";
	}
	
}
