package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
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
	INoticeBoardService noticeBoardService;
	
	// 토론 주제 추천 게시판으로 가기
	@RequestMapping(value = "/discussion_select_board", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @RequestParam("a_no") int a_no, PagingDto pagingDto) throws Exception {
	
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		int totalBoardCount = selectService.totalSelectBoardCount(pagingDto, a_no);
		pagingDto.setTotalData(totalBoardCount);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(pagingDto ,a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("pagingDto", pagingDto);
		
		return "/discussion_board/discussion_select_board";
	}
	
	// 토론 주제 추천 게시판 글작성 페이지로 가기
	@RequestMapping(value="/discussion_select_write", method=RequestMethod.GET)
	public String selectBoardWriteForm(Model model, @RequestParam("a_no") int a_no) throws Exception {
		
		List<AreaDataVo> areaData = noticeBoardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		AreaDataVo getAreaDataANo = noticeBoardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
		
		return "/discussion_board/discussion_select_write";
	}
	
	// 토론 주제 추천 게시판 글 작성 실행
	@RequestMapping(value="/discussion_select_write", method = RequestMethod.POST)
	public String selectBoardWrite(@RequestParam("a_no") int a_no, SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		System.out.println("selectBoardWrite 실행");
		System.out.println("selectDiscussion_BoardVo" + selectDiscussion_BoardVo);
		return "redirect:/selectDiscussion/discussion_select_board?a_no="+a_no;
	}
	
	// 토론 주제 추천 게시판 글 상세보기 페이지
	@RequestMapping(value = "/discussion_select_read", method = RequestMethod.GET)
	public String readSelectBoard(Model model, PagingDto pagingDto, @RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no) throws Exception {
		System.out.println("readSelectBoard 실행");
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = selectService.readSelectBoard(b_no);
		model.addAttribute("selectDiscussion_BoardVo", selectDiscussion_BoardVo);
		return "/discussion_board/discussion_select_read";
	}
	
	// 토론 주제 추천 게시판 글 삭제
	@RequestMapping(value = "/discussion_select_delete", method = RequestMethod.GET)
	public String selectBoardDelete(@RequestParam("a_no") int a_no, @RequestParam("b_no") int b_no) throws Exception {
		selectService.deleteSelectBoard(b_no);
		return "redirect:/selectDiscussion/discussion_select_board?a_no="+a_no;
	}

}
