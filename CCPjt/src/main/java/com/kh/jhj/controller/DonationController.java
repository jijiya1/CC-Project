package com.kh.jhj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jhj.domain.DonationVo;
import com.kh.jhj.service.IDonationBoardService;
import com.kh.jhj.util.Do_UploadUtil;

@Controller
@RequestMapping("/donation/*")
public class DonationController {
	
	@Inject
	private IDonationBoardService doService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
//		System.out.println("도네이숀");
		 List<DonationVo> doList = doService.list();
		 model.addAttribute("doList", doList);
		return "/board/donation_board";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write() throws Exception{
		return "/board/donation_write";
	}
	
	@RequestMapping(value="/writeUpload")
	public String writeUpload(MultipartFile file) throws Exception{
		String fileName = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		
	String asd =Do_UploadUtil.do_Upload(uploadPath, fileName, fileData);
	
	return  "/board/donation_board";
	}
/*	
	@RequestMapping(value="/writeUpload")
	public String writeUpload(MultipartHttpServletRequest multi) {
		
		System.out.println("multi : " + multi);
		List<MultipartFile> fileList = multi.getFiles("realFile");
		for(MultipartFile mf : fileList) {
			String realName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			System.out.println("realName :" +realName);
			System.out.println("fileSize :" +fileSize);
		}
		return  "/board/donation_board";
	}
	
*/
	
}
