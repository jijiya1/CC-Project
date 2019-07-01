package com.kh.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	INoticeBoardService noticeBoardService;

	@RequestMapping(value="/sub_main", method=RequestMethod.GET)
	public void subMain(@RequestParam("a_no") int a_no, Model model) throws Exception {
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
	}
}
