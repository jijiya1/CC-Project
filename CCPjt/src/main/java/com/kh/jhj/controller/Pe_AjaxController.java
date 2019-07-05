package com.kh.jhj.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pe_ajax/*")
public class Pe_AjaxController {

	
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
}
