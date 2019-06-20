package com.kh.shj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice_board/*")
public class NoticeController {
	
	// 공지사항 리스트
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public void noticeBoardList() throws Exception {
//		System.out.println("notice_list get 실행함.");
	}
	
	// 공지사항 작성
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public void noticeBoardWrite() throws Exception {
		System.out.println("notice_write get 실행함.");
	}
}
