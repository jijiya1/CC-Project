package com.kh.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.UserInfoVo;
import com.kh.service.IAdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	IAdminService adminService;
	
	@RequestMapping(value="/user_list", method=RequestMethod.GET)
	public void getUserList(Model model) throws Exception {
		List<UserInfoVo> getUserList = adminService.getUserList();
		model.addAttribute("userinfoVo", getUserList);
		
		int getUserCount = adminService.getUserCount();
		model.addAttribute("getUserCount", getUserCount);
	}
	
	// 회원 관리 버튼 중 탈퇴 기능
	@ResponseBody
	@RequestMapping(value="/user_delete", method=RequestMethod.GET)
	public ResponseEntity<String> userDelete(String u_email) throws Exception {
		ResponseEntity<String> entity = null;
//		System.out.println("u_email : " + u_email);
		try {
			adminService.userDelete(u_email);
//			System.out.println("실행됨");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_GATEWAY);
		}
		
		return entity;
	}
	
	// 회원 정보 강제 수정
	@RequestMapping(value="/user_update", method=RequestMethod.GET)
	public void userUpdate() throws Exception {
		
	}
	
}
