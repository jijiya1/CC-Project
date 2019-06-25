package com.kh.shj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.persistence.NoticeBoardDaoImpl;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/notice_board/*")
public class NoticeController {
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	// 공지사항 리스트
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public void noticeBoardList(Model model) throws Exception {
//		System.out.println("notice_list get 실행함.");
		List<NoticeBoardVo> list = noticeBoardService.noticeBoardList();
		model.addAttribute("list", list);
		
		int count = noticeBoardService.noticeBoardCount();
		model.addAttribute("count", count);
	}
	
	// 공지사항 해당 글 읽기
	@RequestMapping(value="/notice_read", method=RequestMethod.GET)
	public void noticeBoardRead(@RequestParam("b_no") int b_no, Model model) throws Exception {
//		System.out.println("notice_read get 실행함.");
		NoticeBoardVo noticeBoardVo = noticeBoardService.noticeBoardRead(b_no);
		model.addAttribute("noticeBoardVo", noticeBoardVo);
	}
	
	// 공지사항 작성 폼 이동
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public void noticeBoardWrite() throws Exception {
//		System.out.println("notice_write get 실행함.");
	}
	
	// 공지사항 작성 실행
	@RequestMapping(value="/notice_write", method=RequestMethod.POST)
	public String noticeBoardWrite(NoticeBoardVo noticeBoardVo) throws Exception {
		System.out.println("notice_write post 실행함.");
		System.out.println("noticeBoardVo : " + noticeBoardVo);
		noticeBoardService.noticeBoardWrite(noticeBoardVo);
		return "redirect:/notice_board/notice_list";
	}
}
