package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.AreaDataVo;
import com.kh.hys.domain.BoardAgreeInfoVo_Discussion;
import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.service.IBoardService_Discussion;

@Controller
@RequestMapping("/discussion_board/*")
public class MainController_Discussion {
	
	@Inject
	IBoardService_Discussion boardService_Discussion;
	
	// 토론 메인 게시판으로 가기
	@RequestMapping(value = "/discussion_main_board", method=RequestMethod.GET)
	public void discussion_main_board(@RequestParam("a_no") int a_no, Model model) throws Exception {
//		System.out.println("discussion_main_board get 실행");
		
		List<BoardVo_Discussion> discussionList =  boardService_Discussion.getDiscussionList(a_no);
		int discussionListSize = discussionList.size();
		String firstDiscussion_b_serialno =  discussionList.get(0).getB_serialno();
		
		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("discussionList", discussionList);
		model.addAttribute("discussionListSize", discussionListSize);
		model.addAttribute("firstDiscussion_b_serialno", firstDiscussion_b_serialno);
	}
	
	@RequestMapping(value = "/discussion_agreeSelect", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> selectAgreeMent(@RequestBody BoardAgreeInfoVo_Discussion AgreeInfoVo) throws Exception {
//		System.out.println("AgreeInfoVo : " + AgreeInfoVo);
		
		ResponseEntity<String> entity  = null;
		try {
			boardService_Discussion.insertAgreeInfo(AgreeInfoVo);
			BoardVo_Discussion boardVo_Discussion = boardService_Discussion.getAgreeRatio(AgreeInfoVo.getB_no());
			int agreementcount = boardVo_Discussion.getB_agreementcount();
			int oppositioncount = boardVo_Discussion.getB_oppositioncount();
			
			String message = agreementcount + "," + oppositioncount;
			
			entity = new ResponseEntity<>(message,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
