package com.kh.hys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/discussion_board/*")
public class DiscussionController {
	
	// 토론 주제 선정 게시판으로 가기
	@RequestMapping(value = "/Discussion_res_board", method=RequestMethod.GET)
	public void discussion_res_board() {
		
	}

}
