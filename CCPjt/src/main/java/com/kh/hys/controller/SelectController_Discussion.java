package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.service.ISelectService_Discussion;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/selectDiscussion/*")
public class SelectController_Discussion {
	
	@Inject
	ISelectService_Discussion selectService;
	
	@Inject
	INoticeBoardService service;
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/discussion_select_board", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @RequestParam("a_no") int a_no, PagingDto pagingDto) throws Exception {
	
		AreaDataVo areaDataVo = service.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		int totalBoardCount = selectService.totalSelectBoardCount(a_no);
		pagingDto.setTotalData(totalBoardCount);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(pagingDto ,a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "/discussion_board/discussion_select_board";
	}

}
