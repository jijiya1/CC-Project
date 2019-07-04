package com.kh.psh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.kh.psh.domain.Complaint_ReplyVo;
import com.kh.psh.service.IReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private IReplyService replyService;
	
	//댓글 쓰기
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Complaint_ReplyVo replyVo, HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			replyService.insert(replyVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	//댓글 목록
	@RequestMapping(value="/list/{b_no}", method=RequestMethod.GET)
	public ResponseEntity<List<Complaint_ReplyVo>> list(@PathVariable("b_no") int b_no) {
		ResponseEntity<List<Complaint_ReplyVo>> entity = null;
		try {
			List<Complaint_ReplyVo> list = replyService.list(b_no);
			entity = new ResponseEntity<List<Complaint_ReplyVo>>(list, HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<Complaint_ReplyVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//댓글 수정
	@RequestMapping(value="/update/{r_no}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("r_no")int r_no, 
										@RequestBody Complaint_ReplyVo replyVo) throws Exception {
		replyVo.setR_no(r_no);
		ResponseEntity<String> entity = null;
		try {
			replyService.update(replyVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	//댓글 삭제
	@RequestMapping(value="/delete/{r_no}/{b_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(
			@PathVariable("r_no") int r_no,
			@PathVariable("b_no") int b_no) {
		ResponseEntity<String> entity = null;
		try {
			replyService.delete(r_no,b_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}