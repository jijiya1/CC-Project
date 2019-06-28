package com.kh.psh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.psh.domain.Complaint_ReplyVo;
import com.kh.psh.service.IReplyService;

@RestController
@RequestMapping(value="/reply")
public class ReplyController {
	
	@Inject
	private IReplyService replyService;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(@RequestBody Complaint_ReplyVo replyVo, HttpSession session) throws Exception {
		replyService.insert(replyVo);
	}
	public List<Complaint_ReplyVo> list(@PathVariable("b_no")int b_no) throws Exception {
		List<Complaint_ReplyVo> list = replyService.list(b_no);
		return list;
		
	}
}
