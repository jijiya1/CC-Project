package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.service.IBoardService_Discussion;

@Controller
@RequestMapping("/discussion_board/*")
public class MainController_Discussion {
	
	@Inject
	IBoardService_Discussion discussion_BoardService;
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/discussion_res_board", method=RequestMethod.GET)
	public void discussion_res_board() throws Exception {
		discussion_BoardService.getDiscussionList();
	}
	
	// 토론 메인 게시판으로 가기
	@RequestMapping(value = "/discussion_main_board", method=RequestMethod.GET)
	public void discussion_main_board(Model model) throws Exception {
		System.out.println("discussion_main_board get 실행");
		
		List<BoardVo_Discussion> discussionList =  discussion_BoardService.getDiscussionList();
		int discussionListSize = discussionList.size();
		String firstDiscussion_b_serialno =  discussionList.get(0).getB_serialno();
		
		model.addAttribute("discussionList", discussionList);
		model.addAttribute("discussionListSize", discussionListSize);
		model.addAttribute("firstDiscussion_b_serialno", firstDiscussion_b_serialno);
	}
	
}