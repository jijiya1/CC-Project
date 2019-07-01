package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.domain.LocalDto;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.service.ISelectService_Discussion;

@Controller
@RequestMapping("/selectDiscussion/*")
public class SelectController_Discussion {
	
	@Inject
	ISelectService_Discussion selectService;
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/discussion_select_board/{b_addInfo}", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @PathVariable("b_addInfo") int b_addInfo) throws Exception {
		
		LocalDto localDto = new LocalDto();
		localDto.setB_addInfo(b_addInfo);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(localDto);
		
		PagingDto pagingDto = new PagingDto();
		int totalBoardCount = selectService.totalSelectBoardCount(localDto);
		pagingDto.setTotalData(totalBoardCount);
		
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "/discussion_board/discussion_select_board";
	}

}
