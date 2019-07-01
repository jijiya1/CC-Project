package com.kh.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.domain.PagingDto;
import com.kh.persistence.IMainDao;
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
}
