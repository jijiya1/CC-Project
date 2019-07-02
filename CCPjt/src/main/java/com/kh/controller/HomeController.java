package com.kh.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.domain.LoginDto;
import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;
import com.kh.persistence.IMainDao;
import com.kh.sbj.persistence.UserJoinDaoImpl;
import com.kh.sbj.service.IUserJoinService;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.persistence.INoticeBoardDao;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	INoticeBoardDao noticeBoardDao;
	
	@Inject
	IUserJoinService userJoinService;
	
	@Inject
	IMainDao mainDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(
			PagingDto pagingDto, NoSearchDto noSearchDto, NoPagingDto noPagingDto, Model model, Locale locale
			) throws Exception {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<NoticeBoardVo> noticeList = mainDao.getNoticeBoardList(pagingDto);
		model.addAttribute("noticeList", noticeList);

		return "main/main";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(String u_email, Model model) throws Exception{
		System.out.println("로그인이메일");
		model.addAttribute("u_email", u_email);
	}
	
//	@RequestMapping(value = "/login/{u_email}", method = RequestMethod.GET)
//	public void login(@PathVariable("u_email") String u_email, Model model) throws Exception{
//		System.out.println("로그인이메일");
//		model.addAttribute("u_email", u_email);
//	}
	
	@RequestMapping(value = "/login_run", method = RequestMethod.POST)
	public String loginRun(LoginDto loginDto, HttpSession session) throws Exception{
		UserInfoVo userInfoVo = userJoinService.userLogin(loginDto);
		String page = "redirect:/";
		if(userInfoVo==null) {
			page+="login?u_email="+loginDto.getU_email();
		}else {
			session.setAttribute("userInfoVo", userInfoVo);
			page+="main/main";
		}
		System.out.println("page = "+page);
		return page;
	}
	
	
}
