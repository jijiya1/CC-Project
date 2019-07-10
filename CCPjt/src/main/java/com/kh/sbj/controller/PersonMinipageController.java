package com.kh.sbj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sbj.domain.AccountVo;
import com.kh.sbj.domain.PersonAccountDeleteDto;
import com.kh.sbj.domain.PersonPromiseDeleteDto;
import com.kh.sbj.domain.PersonPromiseVo;
import com.kh.sbj.service.IPersonMinipageService;
import com.kh.sbj.util.FileUploadUtil;


@RestController
@RequestMapping("/person_mini/*")
public class PersonMinipageController {
	
	@Inject
	private IPersonMinipageService personMinipageService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	@RequestMapping(value = "/promise_list", method=RequestMethod.GET)
	public ResponseEntity<List<PersonPromiseVo>> personPromiseList(@RequestParam("u_email") String u_email) throws Exception {
		ResponseEntity<List<PersonPromiseVo>> entity = null;
		try {
			List<PersonPromiseVo> list = personMinipageService.selectAllPromise(u_email);
			entity = new ResponseEntity<List<PersonPromiseVo>>(list, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<List<PersonPromiseVo>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
//	 공약 추가
	@RequestMapping(value="/promise_insert", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestParam("file") MultipartFile file, 
			@RequestParam("u_email") String u_email, @RequestParam("p_name") String p_name, @RequestParam("p_progress") int p_progress) throws Exception{
		PersonPromiseVo personPromiseVo = new PersonPromiseVo();
		String originalName = file.getOriginalFilename();
		ResponseEntity<String> entity = null;
		
		try {
			String dirPath = FileUploadUtil.uploadFile(uploadPath, originalName, file.getBytes());
			String path = dirPath.replace("\\", "/");
			personPromiseVo.setU_email(u_email);
			personPromiseVo.setP_name(p_name);
			personPromiseVo.setP_progress(p_progress);
			personPromiseVo.setP_filepath(path);
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
	@RequestMapping(value="/promise_delete/{u_email}/{p_no}", method=RequestMethod.DELETE)
	public  ResponseEntity<String> delete(@PathVariable("u_email") String u_email, @PathVariable("p_no") int p_no){
		ResponseEntity<String> entity = null;
		try {
			PersonPromiseDeleteDto deleteDto = new PersonPromiseDeleteDto(p_no, u_email);
			personMinipageService.deletePromise(deleteDto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	//파일출력
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName) throws Exception{
		
		String realPath = uploadPath + File.separator + fileName;
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
	
	@RequestMapping(value = "/account_list", method=RequestMethod.GET)
	public ResponseEntity<List<AccountVo>> accountList(@RequestParam("u_email") String u_email) throws Exception {
		ResponseEntity<List<AccountVo>> entity = null;
		try {
			List<AccountVo> list = personMinipageService.selectAllAccount(u_email);
			entity = new ResponseEntity<List<AccountVo>>(list, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<List<AccountVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 계좌등록
	@RequestMapping(value="/account_insert", method=RequestMethod.POST)
	public ResponseEntity<String> accInsert(@RequestBody AccountVo accountVo) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			personMinipageService.insertAccount(accountVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//계좌삭제
	@RequestMapping(value="/account_delete/{u_email}/{acc_num}", method=RequestMethod.DELETE)
	public  ResponseEntity<String> delete(@PathVariable("u_email") String u_email, @PathVariable("acc_num") String acc_num){
		ResponseEntity<String> entity = null;
		try {
			PersonAccountDeleteDto deleteDto = new PersonAccountDeleteDto(acc_num, u_email);
			personMinipageService.deleteAccount(deleteDto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
}
