package com.kh.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="user_list", method=RequestMethod.GET)
	public void getUserList(Model model) throws Exception {
		List<UserInfoVo> getUserList = adminService.getUserList();
		model.addAttribute("userinfoVo", getUserList);
		
		int getUserCount = adminService.getUserCount();
		model.addAttribute("getUserCount", getUserCount);
	}
	
	// 회원 관리 버튼 중 탈퇴 기능
	public void userDelete() throws Exception {
		
	}
	
}
