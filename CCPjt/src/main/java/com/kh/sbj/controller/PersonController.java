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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.AssemblyVo;
import com.kh.sbj.service.IPersonService;
import com.kh.sbj.util.FileUploadUtil;


@Controller
@RequestMapping("/person_board/*")
public class PersonController {
	
	@Inject
	private IPersonService personService;
	
	@Resource(name="uploadPath")
	private String uploadPath; //servlet-context.xml (id="uploadPath")
	
	@RequestMapping(value = "/person_list", method = RequestMethod.GET)
	public String personBoardList(Model model, @RequestParam("a_no") int a_no) throws Exception {
		AreaDataVo areaDataVo = personService.selectArea(a_no);
		String a_name = areaDataVo.getA_name();
		List<UserInfoVo> userVoList = personService.selectAll(a_name);
		
		model.addAttribute("memberVoList", userVoList);
		model.addAttribute("areaDataVo", areaDataVo);
		return "/person_board/person_list";
	}
	
	@RequestMapping(value = "/person_minipage", method = RequestMethod.GET)
	public void personMinipage(@RequestParam("u_email") String u_email, @RequestParam("a_no") int a_no, Model model) throws Exception {
		UserInfoVo userInfoVo = personService.selectPerson(u_email);
		AreaDataVo areaDataVo = personService.selectArea(a_no);
		
		List<AssemblyVo> list = personService.selectAssemList(u_email);
		int electionCnt = 0;
		for(AssemblyVo assemVo :list) {
			assemVo.getAssem_no();
			electionCnt++;
		}
		String election_name = personService.selectElection(electionCnt);
		model.addAttribute("assemVoList", list);
		model.addAttribute("election_name", election_name);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("memberSelectedVo", userInfoVo);
	}
	
	@RequestMapping(value="/displayFile")
	@ResponseBody
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
			headers.setContentType(mediaType);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
}
