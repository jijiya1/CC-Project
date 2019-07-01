package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.LocalDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.service.ISelectService_Discussion;

@Controller
@RequestMapping("/selectDiscussion/*")
public class ResController_Discussion {
	
	@Inject
	ISelectService_Discussion selectService;
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/discussion_res_board/{b_addInfo}/{b_detailInfo}", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @PathVariable("b_addInfo") String b_addInfo, @PathVariable("b_detailInfo") String b_detailInfo) throws Exception {
		
		LocalDto localDto = new LocalDto();
		localDto.setB_addInfo(b_addInfo);
		localDto.setB_detailInfo(b_detailInfo);

		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(localDto);
		
		
		PagingDto pagingDto = new PagingDto();
		
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "/discussion_board/discussion_res_board";
	}

}
