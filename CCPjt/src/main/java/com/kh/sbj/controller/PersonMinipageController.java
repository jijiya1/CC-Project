package com.kh.sbj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Multipart;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.sbj.domain.PersonPromiseDeleteDto;
import com.kh.sbj.domain.PersonPromiseVo;
import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.service.IPersonMinipageService;
import com.kh.sbj.service.IPersonService;
import com.kh.sbj.util.FileUploadUtil;


@RestController
@RequestMapping("/person_mini/*")
public class PersonMinipageController {
	
	@Inject
	private IPersonMinipageService personMinipageService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/promise_list/{u_id}", method = RequestMethod.GET)
	public ResponseEntity<List<PersonPromiseVo>> personPromiseList(@PathVariable("u_id") String u_id) throws Exception {
		ResponseEntity<List<PersonPromiseVo>> entity = null;
		try {
			List<PersonPromiseVo> list = personMinipageService.selectAllPromise(u_id);
			entity = new ResponseEntity<List<PersonPromiseVo>>(list, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<List<PersonPromiseVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 공약 추가
	@RequestMapping(value="/promise_insert", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestParam("file") MultipartFile file, 
			@RequestParam("u_id") String u_id, @RequestParam("p_name") String p_name, @RequestParam("p_progress") int p_progress) throws Exception{
		PersonPromiseVo personPromiseVo = new PersonPromiseVo();
		String originalName = file.getOriginalFilename();
		ResponseEntity<String> entity = null;
		
		try {
			String dirPath = FileUploadUtil.uploadFile(uploadPath, originalName, file.getBytes());
			String path = dirPath.replace("\\", "/");
			personPromiseVo.setU_id(u_id);
			personPromiseVo.setP_name(p_name);
			personPromiseVo.setP_progress(p_progress);
			personPromiseVo.setP_filePath(path);
			personMinipageService.insertPromise(personPromiseVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// 공약 수정
	@RequestMapping(value="/promise_update", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@RequestBody PersonPromiseVo personPromiseVo) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			personMinipageService.updatePromise(personPromiseVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//삭제
	@RequestMapping(value="/promise_delete/{u_id}/{p_no}", method=RequestMethod.DELETE)
	public  ResponseEntity<String> delete(@PathVariable("u_id") String u_id, @PathVariable("p_no") int p_no){
		ResponseEntity<String> entity = null;
		try {
			PersonPromiseDeleteDto deleteDto = new PersonPromiseDeleteDto(p_no, u_id);
			personMinipageService.deletePromise(deleteDto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//파일출력
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName) throws Exception{
		System.out.println("fileName = "+ fileName);
		System.out.println("uploadPath = "+ uploadPath);
		
		String realPath = uploadPath + File.separator + fileName;
		System.out.println("realPath = "+ realPath);
		String formatName = FileUploadUtil.getFormatName(fileName).toUpperCase();
		
		MediaType mediaType = null;
		
		if(formatName.equals("JPG")) {
			mediaType = MediaType.IMAGE_JPEG;
		}else if (formatName.equals("PNG")) {
			mediaType = MediaType.IMAGE_PNG;
		}else if (formatName.equals("GIF")) {
			mediaType = MediaType.IMAGE_GIF;
		}else {
			
		}
		
		InputStream is = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			is = new FileInputStream(realPath);
			HttpHeaders headers = new HttpHeaders();
			
			int underscoreIndex = fileName.lastIndexOf("_");
			String downloadName = fileName.substring(underscoreIndex+1);
			headers.setContentType(mediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-disposition", "attachment; filename="+downloadName);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}
