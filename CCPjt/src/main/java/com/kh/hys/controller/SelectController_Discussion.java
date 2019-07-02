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

@Controller
@RequestMapping("/selectDiscussion/*")
public class SelectController_Discussion {
	
	@Inject
	ISelectService_Discussion selectService;
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/discussion_select_board", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @RequestParam("a_no") int a_no, PagingDto pagingDto) throws Exception {
		
		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(a_no);
		
		int totalBoardCount = selectService.totalSelectBoardCount(a_no);
		pagingDto.setTotalData(totalBoardCount);
		
		System.out.println("pagingDto : " + pagingDto);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(pagingDto, a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "/discussion_board/discussion_select_board";
	}

}
