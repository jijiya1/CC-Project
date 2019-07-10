package com.kh.jhj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.jhj.domain.Pe_AgreeVo;
import com.kh.jhj.domain.Pe_ReplyVo;
import com.kh.jhj.service.IPe_ReadService;

@RestController
@RequestMapping("/pe_ajax/*")
public class Pe_AjaxController {

	@Inject
	private IPe_ReadService peReadService;
	
	@RequestMapping(value="uploadLink", method=RequestMethod.POST,
			produces="text/plain; charset=utf-8")
	public ResponseEntity<String> writeLink(@RequestBody String b_link) throws Exception{
//			System.out.println("b_link :" + b_link);
			ResponseEntity<String> entity = null;
			try {
				String link = b_link.substring(1, b_link.length()-1);
//				System.out.println("link : " + link);
				entity = new ResponseEntity<>(link, HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
	
	@RequestMapping(value="upAgree", method=RequestMethod.POST,
					produces="text/plain; charset=utf-8")
	public ResponseEntity<String> upAgree(@RequestBody Pe_AgreeVo peAgreeVo) throws Exception{
//			System.out.println("b_link :" + b_link);
			ResponseEntity<String> entity = null;
			try {
//				System.out.println(peAgreeVo);
				int confirm= peReadService.confirmAgree(peAgreeVo);
				String result ="";
				if(confirm == 0) {
					peReadService.addAgree(peAgreeVo);
					result ="동의하셨습니다.";
					
				}else {
					result = "이미 동의하셨습니다.";
				}
//				System.out.println(" result :" + result);
				entity = new ResponseEntity<>(result, HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
	
	@RequestMapping(value="listReply/{b_serialno}", method=RequestMethod.GET)
	public ResponseEntity<List<Pe_ReplyVo>> listReply
					(@PathVariable("b_serialno") String b_serialno) throws Exception{
		
		ResponseEntity<List<Pe_ReplyVo>> entity = null;
		try {
			List<Pe_ReplyVo> list = peReadService.listReply(b_serialno);
			entity = new ResponseEntity<List<Pe_ReplyVo>>(list, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Pe_ReplyVo>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="writeReply", method=RequestMethod.POST)
	public ResponseEntity<String> writeReply
							(@RequestBody Pe_ReplyVo peReplyVo) throws Exception{
//			System.out.println("에이작! 컨트롤러:" + peReplyVo);
			ResponseEntity<String> entity = null;
			try {
				String writer = peReplyVo.getR_writer();
				String email = peReplyVo.getU_email();
					writer = writer +"("+  email.substring(0, 3)+"**)";
					peReplyVo.setR_writer(writer);
					System.out.println(peReplyVo);
					peReadService.writeReply(peReplyVo);
				entity = new ResponseEntity<>("success", HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
}
