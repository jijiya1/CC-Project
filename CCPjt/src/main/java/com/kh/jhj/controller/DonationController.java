package com.kh.jhj.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.jhj.domain.DonationVo;
import com.kh.jhj.service.IDonationBoardService;

@Controller
@RequestMapping("/donation/*")
public class DonationController {
	
	@Inject
	private IDonationBoardService doService;
		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		System.out.println("도네이숀");
		 List<DonationVo> doList = doService.list();
		 model.addAttribute("doList", doList);
		return "/board/donation_board";
	}
}
