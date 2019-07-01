package com.kh.sbj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.service.IPersonService;
import com.kh.sbj.util.FileUploadUtil;


@Controller
@RequestMapping("/person_upload/*")
public class PersonUploadController {
	
	@Inject
	private IPersonService personService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	
	@RequestMapping(value = "/person_promiseUpload", method = RequestMethod.POST, produces="text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> promiseUpload(MultipartFile file) throws Exception {
		String originalName = file.getOriginalFilename();
		System.out.println("originalFilename : "+ originalName);
		ResponseEntity<String> entity = null;
		
		try {
			String dirPath = FileUploadUtil.uploadFile(uploadPath, originalName, file.getBytes());
			System.out.println("dirPath = " + dirPath);
			String path = dirPath.replace("\\", "/");
			System.out.println("path = " + path);
			entity = new ResponseEntity<>(path, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	@RequestMapping(value = "/person_minipage", method = RequestMethod.GET)
	public void personMinipage(@RequestParam("u_id") String u_id, Model model) throws Exception {
		PersonVo personVo = personService.selectPerson(u_id);
		model.addAttribute("personVo", personVo);
	}
	
}
