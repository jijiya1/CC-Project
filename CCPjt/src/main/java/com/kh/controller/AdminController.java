package com.kh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		model.addAttribute("userVo", getUserList);
	}
	
}
