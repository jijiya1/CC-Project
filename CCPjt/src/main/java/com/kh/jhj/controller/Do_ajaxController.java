package com.kh.jhj.controller;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/do_ajax/*")
public class Do_ajaxController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/uploadList", method=RequestMethod.POST,
			produces="text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		String fileName = file.getOriginalFilename();
		ResponseEntity<String> entity = null;
		try {
			entity =  new ResponseEntity<String>(fileName, HttpStatus.OK);
		}catch(Exception e) {
			entity =  new ResponseEntity<String>("안돼", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
}
