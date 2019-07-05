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
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/discussion_board/*")
public class MainController_Discussion {
	
	@Inject
	IBoardService_Discussion boardService_Discussion;
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	// 토론 메인 게시판으로 가기
	@RequestMapping(value = "/discussion_main_board", method=RequestMethod.GET)
	public void discussion_main_board(@RequestParam("a_no") int a_no, Model model) throws Exception {
		List<BoardVo_Discussion> discussionList =  boardService_Discussion.getDiscussionList(a_no);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		// 리스트 안에 글이 하나라도 있을 경우
		if(discussionList.size() != 0) {
			int discussionListSize = discussionList.size();
			String firstDiscussion_b_serialno =  discussionList.get(0).getB_serialno();
			

			model.addAttribute("discussionListSize", discussionListSize);
			model.addAttribute("firstDiscussion_b_serialno", firstDiscussion_b_serialno);
		}//if
		
		model.addAttribute("discussionList", discussionList);
	}
	
	
	// 찬반 투표 처리
	@RequestMapping(value = "/discussion_agreeSelect", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> selectAgreeMent(@RequestBody BoardAgreeInfoVo_Discussion AgreeInfoVo) throws Exception {
//		System.out.println("MainController_Discussion,  selectAgreeMent 실행");
		ResponseEntity<String> entity  = null;
		try {
			if(!AgreeInfoVo.getU_email().equals("") && AgreeInfoVo != null) {
				
				boardService_Discussion.insertAgreeInfo(AgreeInfoVo);
				
			}  
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
	
	//관리자 권한 기능(토론 글 삭제)
	@RequestMapping(value="/deleteDiscusssionBoard", method=RequestMethod.GET)
	public String deleteDiscusssionBoard(String b_serialno, int a_no) throws Exception {
//		System.out.println("deleteDiscusssionBoard, b_serialno : " + b_serialno);
		boardService_Discussion.deleteDiscussionBySerialno(b_serialno);
		
		return "redirect:/discussion_board/discussion_main_board?a_no="+a_no;
	}
}
